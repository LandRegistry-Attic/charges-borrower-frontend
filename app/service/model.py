class Deed:
    def __init__(self, deed_id, signing_borrower_id, borrowers,
                 lender, land_property, charging_clause,
                 restrictions, provisions, effective_clause,
                 signing_borrower_signed, names_signed):
        self.id = deed_id
        self.signing_borrower_id = signing_borrower_id
        self.borrowers = borrowers
        self.lender = lender
        self.land_property = land_property
        self.charging_clause = charging_clause
        self.restrictions = restrictions
        self.provisions = provisions
        self.effective_clause = effective_clause
        self.signing_borrower_signed = signing_borrower_signed
        self.names_signed = names_signed


class Borrower:
    def __init__(self, name, address):
        self.name = name
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


class SignedStatus:
    def __init__(self, all_signed, names_unsigned):
        self.all_signed = all_signed
        self.names_unsigned = names_unsigned
