from django.core.management import BaseCommand
import csv
import traceback

from kaldb.models import (Interest, OutReachEvent, Researcher, Specialism)
from kaldb.models_authlists import (Department, Faculty, JobPosition,
                                    JobRole)


class Command(BaseCommand):
    help = 'Imports a faculty into the database from CSV.\
            \n \n Usage: import_faculty faculty_name /path/to/file.csv'

    def add_arguments(self, parser):
        parser.add_argument('faculty_name')
        parser.add_argument('csv_path')

    def handle(self, *args, **options):

        # Define arguments
        faculty_name = options['faculty_name']
        csv_path = options['csv_path']

        # Check if faculty exists. If it does, assign it
        # if it doesn't, create it.
        if Faculty.objects.all().filter(name=faculty_name).count():
            faculty = Faculty.objects.all().filter(name=faculty_name)[0]
        else:
            faculty = Faculty()
            faculty.name = faculty_name
            faculty.save()

        # Open csv file
        try:
            with open(csv_path, 'rb') as csv_file:

                reader = csv.reader(csv_file, delimiter=',', quotechar='"', )
                for row in reader:
                    # Initialise
                    researcher = Researcher()

                    # Department - col. 0
                    department_name = row[0]
                    if Department.objects.all().filter(
                            name=department_name).count():
                        researcher.department = Department.objects.all()\
                            .filter(name=department_name)[0]
                    else:
                        department = Department()
                        department.faculty = faculty
                        department.name = department_name
                        department.save()

                        researcher.department = department

                    # First Name(s) - col. 1
                    if len(row[1].split()) > 1:
                        names = row[1].split()
                        researcher.first_name = names[0]
                        researcher.middle_name = (" ").join(names[1:])
                    else:
                        researcher.first_name = row[1]

                    # Surname - col. 2
                    researcher.last_name = row[2]

                    # Position/Job Title (split by in/of or whole) - col. 3
                    position = row[3]
                    if " in " in position:
                        # split
                        position_split = position.split(" in ")
                        position = position_split[0]
                        role = position_split[1]
                        if JobPosition.objects.all().filter(
                                name=position).count():
                            researcher.position = JobPosition.objects\
                                .all().filter(name=position)[0]
                        else:
                            new_position = JobPosition()
                            new_position.name = position
                            new_position.save()
                            researcher.position = new_position

                        if JobRole.objects.all().filter(name=role).count():
                            researcher.role = JobRole.objects\
                                .all().filter(name=role)[0]
                        else:
                            new_role = JobRole()
                            new_role.name = role
                            new_role.save()
                            researcher.role = new_role
                    elif " of " in position:
                        # split
                        position_split = position.split(" of ")
                        position = position_split[0]
                        role = position_split[1]
                        if JobPosition.objects.all().filter(name=position)\
                                .count():
                            researcher.position = JobPosition.objects.all()\
                                .filter(name=position)[0]
                        else:
                            new_position = JobPosition()
                            new_position.name = position
                            new_position.save()
                            researcher.position = new_position

                        if JobRole.objects.all().filter(name=role).count():
                            researcher.role = JobRole.objects.all()\
                                .filter(name=role)[0]
                        else:
                            new_role = JobRole()
                            new_role.name = role
                            new_role.save()
                            researcher.role = new_role
                    else:
                        if JobPosition.objects.all().filter(name=position)\
                                .count():
                            researcher.position = JobPosition.objects.all()\
                                .filter(name=position)[0]
                        else:
                            new_position = JobPosition()
                            new_position.name = position
                            new_position.save()
                            researcher.position = new_position

                    # Profile URL - col. 8
                    researcher.profile_url = row[8]

                    # Pure URL - col. 9
                    researcher.pure_url = row[9]

                    # E-Mail Address + can email? - col. 10
                    researcher.email = row[10]
                    researcher.can_email = True

                    # And save...
                    researcher.save()

                    ###
                    # These all need to be done *after* saving since
                    # they're ManyToManyFields
                    ###

                    # Research Interests - col. 4
                    if row[4].strip():
                        interests = [x.strip() for x in row[4].split("*")]
                        for i in interests:
                            if i:
                                # Check if it exists or create it
                                # you know the drill by now

                                if Interest.objects.all().filter(
                                        name=i).count():
                                    researcher.research_interests.add(
                                        Interest.objects.all().filter(
                                            name=i)[0])
                                else:
                                    interest = Interest()
                                    interest.name = i
                                    interest.save()
                                    researcher.research_interests.add(interest)

                    # Teaching Interests - col. 5
                    if row[5].strip():
                        interests = [x.strip() for x in row[5].split("*")]
                        for i in interests:
                            if i:
                                # Check if it exists or create it
                                # you know the drill by now
                                if Interest.objects.all().filter(
                                        name=i).count():
                                    researcher.teaching_interests\
                                        .add(Interest.objects.all()
                                             .filter(name=i)[0])
                                else:
                                    interest = Interest()
                                    interest.name = i
                                    interest.save()
                                    researcher.teaching_interests.add(interest)

                    # Outreach - col. 6
                    if row[6].strip():
                        events = [x.strip() for x in row[6].split("*")]
                        for e in events:
                            if e:
                                event = OutReachEvent()
                                event.researcher = researcher
                                event.name = e
                                event.save()

                    # London specialisms - col. 7
                    if row[7].strip():
                        specialisms = [x.strip() for x in row[7].split("*")]
                        for s in specialisms:
                            if s:
                                # Check if it exists or create it
                                # you know the drill by now
                                if Specialism.objects.all().filter(name=s)\
                                        .count():
                                    researcher.specialisms.add(
                                        Specialism.objects.all()
                                        .filter(name=s)[0])
                                else:
                                    specialism = Specialism()
                                    specialism.name = s
                                    specialism.save()
                                    researcher.specialisms.add(specialism)

        except Exception, e:
            print "An error occured - caught Exception"
            print e
            traceback.print_exc()
