import requests

from app import config
from app.service.model import Borrower, LandProperty, Lender, Address, Deed

DEED_API_BASE_HOST = config.DEED_API_BASE_HOST


def get_deed_json(md_ref):
    return requests.get(DEED_API_BASE_HOST + '/deed/' + str(md_ref)).json()


def get_deed(md_ref):
    def borrowers_from_json(borrowers_json):
        def borrower_from_dict(borrower):
            return Borrower(borrower['forename'],
                            borrower['surname'],
                            borrower['middle'],
                            address_from_json(borrower['address']))

        return [borrower_from_dict(item) for item in borrowers_json]

    def lender_from_json(lender_json):
        return Lender(lender_json['name'],
                      address_from_json(lender_json['address']),
                      lender_json['company-no'])

    def property_from_json(property_json):
        return LandProperty(address_from_json(property_json['address']),
                            property_json['property-title-no'])

    def address_from_json(address_json):
        return Address(address_json['street-address'],
                       address_json['extended-address'],
                       address_json['locality'],
                       address_json['postal-code'])

    def deed_from_json(deed_json):
        return Deed(borrowers_from_json(deed_json['borrowers']),
                    lender_from_json(deed_json['lender']),
                    property_from_json(deed_json['property']))

    deed_json = get_deed_json(md_ref)

    return deed_from_json(deed_json)
