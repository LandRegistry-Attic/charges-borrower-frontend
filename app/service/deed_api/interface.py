class DeedApiInterface(object):

    def __init__(self, implementation):
        self.implementation = implementation

    def get_borrowers(self, ids):
        return self.implementation.get_borrowers(ids)

    def get_lender(self):
        return self.implementation.get_lender()

    def get_land_property(self):
        return self.implementation.get_land_property()

    def get_address(self, address_json):
        return self.implementation.get_address(address_json)

    def get_borrowers_json(self, ids):
        return self.implementation.get_borrowers_json(ids)

    def get_lender_json(self):
        return self.implementation.get_lender_json()

    def get_property_json(self):
        return self.implementation.get_property_json()
