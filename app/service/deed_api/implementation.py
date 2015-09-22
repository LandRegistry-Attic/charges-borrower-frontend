import requests

from app import config
from app.service.model import (
    Borrower, LandProperty, Lender, Address, Deed, SignedStatus
)

DEED_API_BASE_HOST = config.DEED_API_BASE_HOST


def get_deed_json(borrower_token):
    return requests.get(DEED_API_BASE_HOST + '/deed/borrower/' +
                        str(borrower_token)).json()


def get_signed_status_json(deed_id):
    return requests.get(DEED_API_BASE_HOST + '/deed/' +
                        str(deed_id) + '/signed_status').json()


def get_signed_status(deed_id):

    signed_status_json = get_signed_status_json(deed_id)

    return SignedStatus(signed_status_json["all_signed"],
                        signed_status_json["names"])


def get_deed(borrower_token):
    def borrowers_from_json(borrowers_json):
        def borrower_from_dict(borrower):
            name = "%s %s %s" % (borrower['first_name'],
                                 borrower['middle_names'],
                                 borrower['last_name'])

            return Borrower(name, borrower['address'])

        return [borrower_from_dict(item) for item in borrowers_json]

    def deed_id_from_json(deed_id_json):
        return deed_id_json['id']

    def signing_borrower_id_from_json(borrowers):
        borrower = list(filter(lambda borrower_item:
                               borrower_item["token"] ==
                               borrower_token, borrowers))

        return borrower[0]["id"]

    def lender_from_json(lender_json):
        return Lender(lender_json['name'],
                      address_from_json(lender_json['address']),
                      lender_json['company-number'])

    def title_from_json(title_json):
        return LandProperty(address_from_json(title_json['address']),
                            title_json['title-number'])

    def address_from_json(address_json):
        return Address(address_json['street-address'],
                       address_json['extended-address'],
                       address_json['locality'],
                       address_json['postal-code'])

    def charging_clause_from_json(operative_deed):
        return operative_deed['charging-clause']

    def restrictions_from_json(operative_deed):
        return operative_deed['restrictions']

    def provisions_from_json(operative_deed):
        return operative_deed['provisions']

    def effective_clause_from_json(operative_deed):
        return operative_deed['effective-clause']

    def signing_borrower_signed_from_json(deed):
        signatures = list(
            filter(lambda signature:
                   type(signature) is dict,
                   deed.get("signatures")))

        signing_borrower = signing_borrower_id_from_json(
            deed['operative-deed']["borrowers"]
        )

        signed = list(filter(lambda signature:
                             signature["borrower_id"] == signing_borrower,
                             signatures))

        return True if len(signed) > 0 else False

    def borrowers_signed_from_json(signatures):
        signatures = list(
            filter(lambda signature:
                   type(signature) is dict,
                   signatures))

        def _borrower_name(signature):
            return signature['borrower_name']

        names_signed = map(_borrower_name, signatures)

        return names_signed

    def deed_from_json(deed_json):
        deed = deed_json['deed']
        operative_deed = deed['operative-deed']

        return Deed(deed_id_from_json(deed_json),
                    signing_borrower_id_from_json(operative_deed['borrowers']),
                    borrowers_from_json(operative_deed['borrowers']),
                    lender_from_json(operative_deed['lender']),
                    title_from_json(operative_deed['title']),
                    charging_clause_from_json(operative_deed),
                    restrictions_from_json(operative_deed),
                    provisions_from_json(operative_deed),
                    effective_clause_from_json(operative_deed),
                    signing_borrower_signed_from_json(deed),
                    borrowers_signed_from_json(deed["signatures"]))

    deed_json = get_deed_json(borrower_token)

    return deed_from_json(deed_json)
