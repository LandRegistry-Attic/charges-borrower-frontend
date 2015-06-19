from app.views.template import Template


class View(Template):
    pageTitle = "Sign your mortgage deed"

    def __init__(self, deed):
        self.borrowers = deed.borrowers
        self.lender = deed.lender
        self.land_property = deed.land_property


class NotFound(Template):
    pageTitle = "Deed not found!"
