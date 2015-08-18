class DeedApiInterface(object):
    def __init__(self, implementation):
        self.implementation = implementation

    def get_deed(self, borrower_token):
        return self.implementation.get_deed(borrower_token)

    def get_signed_status(self, deed_id):
        return self.implementation.get_signed_status(deed_id)
