# -*- coding: latin-1 -*-
from django.core.management import BaseCommand
import csv
import traceback

from kaldb.models import (Researcher, Collaboration, Institution)
from kaldb.models_authlists import (AwardType, StageType, InstitutionCategory,
                                    InstitutionSector, OutReachLocation, OutReachCity,
                                    Faculty, Title)

date_map = {
    'Jan': 1,
    'Feb': 2,
    'Mar': 3,
    'Apr': 4,
    'May': 5,
    'Jun': 6,
    'Jul': 7,
    'Aug': 8,
    'Sep': 9,
    'Oct': 10,
    'Nov': 11,
    'Dec': 12
}

class Command(BaseCommand):
    help = 'Imports collaboration data from CSV.\
            \n \n Usage: import_collaborations /path/to/file.csv'

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
                    collab = Collaboration()

                    # Col 0: Stage? Ignore
                    # Col 1: Stage type? Award/Renewal
                    stage_type = row[1]

                    if StageType.objects.all().filter(
                            name=stage_type).count():
                        collab.stage_type = StageType.objects.all()\
                            .filter(name=stage_type)[0]
                    else:
                        s = StageType()
                        s.name = stage_type
                        s.save()

                        collab.stage_type = s


                    # Col 2: Value
                    collab.value = float(row[2].replace('£','')\
                        .replace(',',''))


                    # Col 3: Title
                    collab.name = row[3]

                    # Col 4: Project type (Research Grant, etc.)
                    award_type = row[1]

                    if AwardType.objects.all().filter(
                            name=award_type).count():
                        collab.award_type = AwardType.objects.all()\
                            .filter(name=award_type)[0]
                    else:
                        a = AwardType()
                        a.name = award_type
                        a.save()

                        collab.award_type = a

                    # Col 5: Award Date
                    # Format: dd-Mon-yy yay
                    dates = row[5].split("-")
                    collab.date_d = int(dates[0])
                    collab.date_m = date_map[dates[1]]
                    collab.date_y = int("20{}".format(dates[2]))

                    # Col 6: Year - taken care of in 5?

                    # Col 8: School/Faculty
                    faculty_name = row[8]
                    faculty_obj = Faculty.objects.all()\
                        .filter(name=faculty_name)

                    if faculty_obj.count():
                        collab.faculty = faculty_obj[0]
                    else:
                        faculty_obj = Faculty()
                        faculty_obj.name = faculty_name
                        faculty_obj.save()

                        collab.faculty = faculty_obj
                    # Col 9: Ignore

                    # Col 10: Is partner the lead?
                    collab.partner_is_lead = row[10] == "Lead"

                    # Col 11: Partner
                    partner_name = row[11]
                    if Institution.objects.all().filter(
                            name=partner_name).count():
                        collab.partner = Institution.objects.all()\
                            .filter(name=partner_name)[0]
                    else:
                        # Col 12: Town/City
                        # Col 13: Company Type
                        # Col 14: Sector
                        city_name = row[12]
                        company_type = row[13]
                        company_sector = row[14]

                        i = Institution()
                        i.name = partner_name


                        type_obj = InstitutionCategory.objects.all()\
                            .filter(description=company_type)

                        if type_obj.count():
                            i.category = type_obj[0]
                        else:
                            type_obj = InstitutionCategory()
                            type_obj.description = company_type
                            type_obj.save()
                            i.category = type_obj

                        sector_obj = InstitutionSector.objects.all()\
                            .filter(description=company_sector)

                        if sector_obj.count():
                            i.sector = sector_obj[0]
                        else:
                            sector_obj = InstitutionSector()
                            sector_obj.name = company_sector
                            sector_obj.save()
                            i.sector = sector_obj

                        # save it
                        i.save()
                        collab.partner = i


                        # This bit needs to be done after that's saved
                        location_obj = OutReachLocation.objects.all()\
                            .filter(name=partner_name)

                        if location_obj.count():
                            i.location.add(location_obj[0])
                        else:
                            location_obj = OutReachLocation()
                            location_obj.name = partner_name
                            city_obj = OutReachCity.objects.all()\
                                .filter(name=city_name)

                            if city_obj.count():
                                location_obj.city = city_obj[0]
                            else:
                                city_obj = OutReachCity()
                                city_obj.name = city_name
                                city_obj.save()
                                location_obj.city = city_obj
                            
                            location_obj.save()
                            i.location.add(location_obj)


                    # Save!
                    collab.save()

                    # Col 7: PI/CI - Weird formatting - M2M so
                    # Needs to be done post-save
                    investigators = row[7]

                    if '\r\n' in investigators:
                        # Multiples
                        investigators = investigators.split('\r\n')
                    else:
                        # This is a sneaky hack, but it means we can do
                        # the next bit in one go.
                        investigators = [investigators]

                    for line in investigators:
                        line = line.split(":")
                        attr = line[0].lower().strip()
                        researcher_str = map(str.strip, line[1].split(','))

                        researchers = []

                        for r in researcher_str:
                            names = r.split(' ')
                            if len(names) > 1:
                                job_title = names[0]
                                first_name = names[1]
                                middle_name = None
                                last_name = names[-1]
                                if len(names) > 4:
                                    middle_name = ' '.join(names[2:-1])

                                researcher_obj = None # scoping

                                if middle_name:
                                    researcher_obj = Researcher.objects.all()\
                                        .filter(first_name=first_name,
                                                middle_name=middle_name,
                                                last_name=last_name)
                                else:
                                    researcher_obj = Researcher.objects.all()\
                                        .filter(first_name=first_name,
                                                last_name=last_name)

                                if researcher_obj.count():
                                    researchers.append(researcher_obj[0])
                                else:
                                    researcher = Researcher()

                                    researcher.first_name = first_name

                                    if middle_name:
                                        researcher.middle_name = middle_name

                                    researcher.last_name = last_name

                                    title_obj = Title.objects.all()\
                                        .filter(name=job_title)
                                    if title_obj.count():
                                        researcher.title = title_obj[0]
                                    else:
                                        title_obj = Title()
                                        title_obj.name = job_title
                                        title_obj.save()

                                        researcher.title = title_obj

                                    if attr == "pi" and not collab.partner_is_lead:
                                        researcher.external = True
                                    elif attr == "pi":
                                        researcher.external = False
                                    else:
                                        researcher.external = True

                                    researcher.save()

                                    researchers.append(researcher)

                        setattr(collab, attr, researchers)



        except Exception, e:
            print "An error occured - caught Exception"
            print e
            traceback.print_exc()
