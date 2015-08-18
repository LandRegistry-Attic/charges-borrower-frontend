from app.views.template import Template


class Confirmation(Template):
    pageTitle = "You have signed the deed"

    def __init__(self, deed, signed_status):
        self.signed_status = signed_status
        self.deed = deed
