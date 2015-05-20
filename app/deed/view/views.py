from app.views.template import Template


class View(Template):
    def __init__(self, borrower):
        self.address_1 = borrower.get('borrower_addr_1')
        self.address_2 = borrower.get('borrower_addr_2')
        self.city = borrower.get('borrower_cit')
        self.forename = borrower.get('borrower_forename')
        self.middlename = borrower.get('borrower_middle')
        self.postcode = borrower.get('borrower_postcode')
        self.surname = borrower.get('borrower_surname')

    pageTitle = "Deed"
