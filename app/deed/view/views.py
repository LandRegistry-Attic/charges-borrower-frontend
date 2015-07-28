from app.views.template import Template


class View(Template):
    pageTitle = "Sign your mortgage deed"

    def __init__(self, deed):
            self.deed = deed

    def has_restriction(self):
        return self.deed.restrictions != []

    def has_provision(self):
        return self.deed.provisions != []


class NotFound(Template):
    pageTitle = "Deed not found"
