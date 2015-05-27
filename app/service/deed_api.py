from app import config
from app.service.model import Borrower, LandProperty, Lender, Address
import requests

DEED_API_BASE_HOST = config.DEED_API_BASE_HOST


def get_borrowers():
    def borrower_from_dict(borrower):
        return Borrower(borrower.get('forename'),
                        borrower.get('surname'),
                        borrower.get('middle'),
                        get_address(borrower.get('address')))

    borrowers = get_borrowers_json()
    return [borrower_from_dict(item) for item in borrowers]


def get_lender():
    lender = get_lender_json()
    return Lender(lender.get('name'),
                  get_address(lender.get('address')),
                  lender.get('company-no'))


def get_land_property():
    land_property = get_property_json()
    return LandProperty(get_address(land_property.get('address')),
                        land_property.get('property-title-no'))


def get_address(address_json):
    return Address(address_json.get('street-address'),
                   address_json.get('extended-address'),
                   address_json.get('locality'),
                   address_json.get('postal-code'))


def get_borrowers_json():
    response_1 = requests.get(DEED_API_BASE_HOST + '/borrower/1')
    response_2 = requests.get(DEED_API_BASE_HOST + '/borrower/2')
    return [response_1.json(), response_2.json()]


def get_lender_json():
    response = requests.get(DEED_API_BASE_HOST + '/lender')
    return response.json()


def get_property_json():
    response = requests.get(DEED_API_BASE_HOST + '/property')
    return response.json()
