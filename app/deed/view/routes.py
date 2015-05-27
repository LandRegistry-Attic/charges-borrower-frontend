import requests
from app.deed.view import views
from app.domain.borrower import Borrower
from app.domain.lender import Lender
from app.domain.land_property import LandProperty
from flask import redirect


def register_routes(blueprint):
    deed_api_base_host = 'http://localhost:5050'

    @blueprint.route('/deed/view')
    def view_deed():
        # handle non existing deed
        # return redirect('/deed/not_found', 303)
        borrowers = get_borrowers(get_borrowers_json())
        lender = get_lender(get_lender_json())
        land_property = get_land_property(get_property_json())
        return views.View(borrowers, lender, land_property).render()

    def get_borrowers(borrowers):
        return [borrower_from_dict(item) for item in borrowers]

    def borrower_from_dict(borrower):
        return Borrower(borrower.get('borrower_forename'),
                        borrower.get('borrower_surname'),
                        borrower.get('borrower_middle'),
                        borrower.get('borrower_addr_1'),
                        borrower.get('borrower_addr_2'),
                        borrower.get('borrower_city'),
                        borrower.get('borrower_postcode'))

    def get_lender(lender):
        return Lender(lender.get('lender_name'),
                      lender.get('lender_addr_1'),
                      lender.get('lender_addr_2'),
                      lender.get('lender_city'),
                      lender.get('lender_company_no'))

    def get_land_property(land_property):
        return LandProperty(land_property.get('property_addr_1'),
                            land_property.get('property_addr_2'),
                            land_property.get('property_city'),
                            land_property.get('property_title_no'))

    def get_borrowers_json():
        response_1 = requests.get(deed_api_base_host + '/get-borrower/1')
        response_2 = requests.get(deed_api_base_host + '/get-borrower/2')
        return [response_1.json(), response_2.json()]

    def get_lender_json():
        response = requests.get(deed_api_base_host + '/get-lender')
        return response.json()

    def get_property_json():
        response = requests.get(deed_api_base_host + '/get-property')
        return response.json()

    @blueprint.route('/deed/not_found')
    def deed_not_found():
        return views.NotFound().render()
