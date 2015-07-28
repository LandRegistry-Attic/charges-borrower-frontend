from app.service.model import Borrower, LandProperty, Lender, Address, Deed
from flask.ext.api import status
from flask import jsonify


class DeedApiMockClient:
    def get_deed(self, md_ref):
        address = Address("Flat 16 Kingman Court",
                          "Verdant Road",
                          "London",
                          "SV19 9BT")
        borrower = Borrower("John Andrew", address)
        lender = Lender("Bank of England Plc", address, "2347676")
        land_property = LandProperty(address, "GHR67832")
        deed = Deed("", "", [borrower], lender, land_property, "", [], [], "")

        return deed


class ScribeApiMockClient:
    def sign_deed(self, deed_id, borrower_id, borrower_name):
        return jsonify(status_code=status.HTTP_200_OK)
