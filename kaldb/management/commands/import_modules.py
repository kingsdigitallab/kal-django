from django.core.management import BaseCommand
import csv
import traceback

from kaldb.models import (Researcher, Module)
from kaldb.models_authlists import (Department, Faculty, ModuleLevel)


class Command(BaseCommand):
    help = 'Imports a module into the database from CSV.\
            \n \n Usage: import_faculty /path/to/file.csv'

    def add_arguments(self, parser):
        parser.add_argument('csv_path')

    def handle(self, *args, **options):

        # Define arguments
        csv_path = options['csv_path']

        # Open csv file
        try:
            with open(csv_path, 'rb') as csv_file:

                reader = csv.reader(csv_file, delimiter=',', quotechar='"', )
                for row in reader:
                    # Initialise
                    module = Module()

                    # Col 0: Department
                    # Col 1: Faculty (If department already exists, ignore)
                    if row[0]:
                        departments = Department.objects.all()\
                            .filter(name=row[0])
                        if departments.count():
                            module.department = departments[0]
                        else:
                            department = Department()
                            department.name = row[0]
                            faculties = Faculty.objects.all()\
                                .filter(name=row[1])
                            if faculties.count():
                                department.faculty = faculties[0]
                            else:
                                faculty = Faculty()
                                faculty.name = row[1]
                                faculty.save()
                                department.faculty = faculty
                            department.save()
                            module.department = department

                    # Col 3: Title
                    module.name = row[3]

                    # Col 4: URL
                    module.url = row[4]

                    # Col 5: Description
                    module.description = row[5]

                    # Col 7: Teaching Patterns
                    module.teaching_pattern = row[7]

                    # Col 8: Assessment
                    module.assessment = row[8]

                    # Aaaaand save.
                    module.save()

                    # Col 2: Convenors (Split by " and ", can be null)
                    # M2M needs to be done after save
                    if row[2]:
                        if " and " in row[2]:
                            # Multiple!
                            for res in row[2].split(" and "):
                                name = res.split(" ")
                                researchers = Researcher.objects.all()\
                                    .filter(first_name=name[0],
                                            last_name=name[1])
                                if researchers.count():
                                    module.convenors.add(researchers[0])
                                else:
                                    researcher = Researcher()
                                    researcher.first_name = name[0]
                                    researcher.last_name = name[1]
                                    researcher.save()
                                    module.convenors.add(researcher)
                        else:
                            # Single researcher
                            name = row[2].split(" ")
                            researchers = Researcher.objects.all()\
                                .filter(first_name=name[0],
                                        last_name=name[1])
                            if researchers.count():
                                module.convenors.add(researchers[0])
                            else:
                                researcher = Researcher()
                                researcher.first_name = name[0]
                                researcher.last_name = name[1]
                                researcher.save()
                                module.convenors.add(researcher)

                    # Col 6: level - M2M again, split by "and"
                    if " and " in row[6]:
                        for level in row[6].split(" and "):
                            module_levels = ModuleLevel.objects.all()\
                                .filter(name=level)
                            if module_levels.count():
                                module.level.append(module_levels[0])
                            else:
                                module_level = ModuleLevel()
                                module_level.name = level
                                module_level.save()
                                module.level.add(module_level)
                    else:
                        module_levels = ModuleLevel.objects.all()\
                            .filter(name=row[6])
                        if module_levels.count():
                            module.level.add(module_levels[0])
                        else:
                            module_level = ModuleLevel()
                            module_level.name = row[6]
                            module_level.save()
                            module.level.add(module_level)

        except Exception, e:
            print "An error occured - caught Exception"
            print e
            traceback.print_exc()
