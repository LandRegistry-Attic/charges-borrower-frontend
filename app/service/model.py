class Deed:
    def __init__(self, borrowers, lender, land_property):
        self.borrowers = borrowers
        self.lender = lender
        self.land_property = land_property


class Borrower:
    def __init__(self, forename, surname, middle_name, address):
        self.forename = forename
        self.surname = surname
        self.middle_name = middle_name
        self.address = address


class LandProperty:
    def __init__(self, address, title_no):
        self.address = address
        self.title_no = title_no


class Lender:
    def __init__(self, name, address, company_no):
        self.name = name
        self.address = address
        self.company_no = company_no


class Address:
    def __init__(self, street, extended, locality, postal_code):
        self.street_address = street
        self.extended_address = extended
        self.locality = locality
        self.postal_code = postal_code
