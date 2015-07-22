class ScribeApiInterface(object):
    def __init__(self, implementation):
        self.implementation = implementation

    def sign_deed(self, deed_id, borrower_id,  borrower_name):
        return self.implementation.sign_deed(deed_id,
                                             borrower_id,
                                             borrower_name)
