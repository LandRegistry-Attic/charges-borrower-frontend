from app import config
from app.service.model import Borrower, LandProperty, Lender, Address
import requests

DEED_API_BASE_HOST = config.DEED_API_BASE_HOST


def get_borrowers(ids):
    def borrower_from_dict(borrower):
        return Borrower(borrower.get('forename'),
                        borrower.get('surname'),
                        borrower.get('middle'),
                        get_address(borrower.get('address')))

    def with_index(borrower, index):
        borrower.index = index
        return borrower

    return [with_index(borrower_from_dict(item), idx) for idx, item in
            enumerate(get_borrowers_json(ids))]


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


def get_borrowers_json(ids):
    borrowers = []
    for borrower_id in ids:
        response = requests.get
        (DEED_API_BASE_HOST + '/borrower/' + str(borrower_id))
        if response.status_code == 200:
            borrowers.append(response.json())
    return borrowers


def get_lender_json():
    response = requests.get(DEED_API_BASE_HOST + '/lender')
    return response.json()


def get_property_json():
    response = requests.get(DEED_API_BASE_HOST + '/property')
    return response.json()
