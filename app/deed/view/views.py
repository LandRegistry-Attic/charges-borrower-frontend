from app.views.template import Template


class View(Template):
    pageTitle = "Sign your mortgage deed"

    def __init__(self, borrowers, lender, land_property):
        self.borrowers = borrowers
        self.lender = lender
        self.land_property = land_property


class NotFound(Template):
    pageTitle = "Deed not found!"
