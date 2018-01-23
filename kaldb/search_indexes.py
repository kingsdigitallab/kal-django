from haystack import indexes
from kaldb.models import Researcher, Module, Theme
from kaldb.models_authlists import Department, Faculty


class DepartmentIndex(indexes.SearchIndex, indexes.Indexable):
    name = indexes.CharField(model_attr='name')
    text = indexes.CharField(document=True, use_template=True)

    def get_model(self):
        return Department

    def index_queryset(self, using=None):
        """Used when the entire index for model is updated."""
        return self.get_model().objects.all()


class FacultyIndex(indexes.SearchIndex, indexes.Indexable):
    name = indexes.CharField(model_attr='name')
    text = indexes.CharField(document=True, use_template=True)

    def get_model(self):
        return Faculty

    def index_queryset(self, using=None):
        """Used when the entire index for model is updated."""
        return self.get_model().objects.all()


class ModuleIndex(indexes.SearchIndex, indexes.Indexable):
    name = indexes.CharField(model_attr='name')
    department = indexes.CharField(faceted=True)
    faculty = indexes.CharField(faceted=True)

    text = indexes.CharField(document=True, use_template=True)

    themes = indexes.MultiValueField(faceted=True)
    institutions = indexes.MultiValueField(faceted=True)
    level = indexes.MultiValueField(faceted=True)
    outreachlocations = indexes.MultiValueField(faceted=True)

    related_interests = indexes.MultiValueField(faceted=True)

    convenors = indexes.MultiValueField()

    def get_model(self):
        return Module

    def index_queryset(self, using=None):
        """Used when the entire index for model is updated."""
        return self.get_model().objects.all()

    def prepare(self, object):
        self.prepared_data = super(ModuleIndex, self).prepare(object)

        self.prepared_data['convenors'] =\
            [o.get_name() for o in object.convenors.all()]
        self.prepared_data['level'] =\
            [o.name for o in object.level.all()]

        self.prepared_data['themes'] =\
            [o.name for o in object.theme_set.all()]
        self.prepared_data['institutions'] =\
            [o.name for o in object.institutions.all()]
        self.prepared_data['outreachlocations'] =\
            [o.name for o in object.locations.all()]

        self.prepared_data['related_interests'] = []
        for c in object.convenors.all():
            res_int = c.research_interests.all()
            tea_int = c.teaching_interests.all()
            qs = res_int | tea_int
            self.prepared_data['related_interests'].append(
                [o.name for o in qs.all()])

        if object.department:
            self.prepared_data['department'] = object.department.name
            if object.department.faculty:
                self.prepared_data['faculty'] = object.department.faculty.name

        return self.prepared_data


class ResearcherIndex(indexes.SearchIndex, indexes.Indexable):
    name = indexes.CharField()
    role = indexes.CharField()
    position = indexes.CharField(faceted=True)
    department = indexes.CharField(faceted=True)
    faculty = indexes.CharField(faceted=True)
    text = indexes.CharField(document=True, use_template=True)

    research_interests = indexes.MultiValueField()
    teaching_interests = indexes.MultiValueField()
    specialisms = indexes.MultiValueField()

    def get_model(self):
        return Researcher

    def index_queryset(self, using=None):
        """Used when the entire index for model is updated."""
        return self.get_model().objects.all()

    def prepare(self, object):
        self.prepared_data = super(ResearcherIndex, self).prepare(object)

        if object.role:
            self.prepared_data['role'] = object.role.name

        if object.position:
            self.prepared_data['position'] = object.position.name

        self.prepared_data['name'] = object.get_name()

        self.prepared_data['research_interests'] =\
            [o.name for o in object.research_interests.all()]
        self.prepared_data['teaching_interests'] =\
            [o.name for o in object.teaching_interests.all()]
        self.prepared_data['specialisms'] =\
            [o.name for o in object.specialisms.all()]

        if object.department:
            self.prepared_data['department'] = object.department.name
            if object.department.faculty:
                self.prepared_data['faculty'] = object.department.faculty.name

        return self.prepared_data


class ThemeIndex(indexes.SearchIndex, indexes.Indexable):
    name = indexes.CharField(model_attr='name')
    description = indexes.CharField(model_attr='description')
    text = indexes.CharField(document=True, use_template=True)

    roles = indexes.MultiValueField()
    modules = indexes.MultiValueField()

    def get_model(self):
        return Theme

    def index_queryset(self, using=None):
        """Used when the entire index for model is updated."""
        return self.get_model().objects.all()

    def prepare(self, object):
        self.prepared_data = super(ThemeIndex, self).prepare(object)

        self.prepared_data['roles'] = [o.name for o in object.roles.all()]
        self.prepared_data['modules'] = [o.name for o in object.modules.all()]

        return self.prepared_data
