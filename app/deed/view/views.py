from app.views.template import Template


class View(Template):
    pageTitle = "Sign your mortgage deed"

    def __init__(self, deed):
            self.deed = deed


class NotFound(Template):
    pageTitle = "Deed not found!"
