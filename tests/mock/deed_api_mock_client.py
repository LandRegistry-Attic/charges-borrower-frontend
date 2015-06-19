from tests.mock.mock_response import MockJsonResponse


class DeedApiMockClient:
    @staticmethod
    def get_deed(md_ref):
        deed = {
            "borrowers": [{
                "forename": "Peter",
                "middle": "",
                "surname": "Smith",
                "address": {
                    "street-address": "Flat 16 Kingman Court",
                    "extended-address": "Verdant Road",
                    "locality": "London",
                    "postal-code": "SV19 9BT",
                },
            }, {
                "forename": "Sarah",
                "middle": "Jane",
                "surname": "Spencer",
                "address": {
                    "street-address": "Flat 16 Kingman Court",
                    "extended-address": "Verdant Road",
                    "locality": "London",
                    "postal-code": "SV19 9BT",
                },
            }],
            "property": {
                "address": {
                    "street-address": "Flat 16 Kingman Court",
                    "extended-address": "Verdant Road",
                    "locality": "London",
                    "postal-code": "",
                },
                "property-title-no": "GHR67832",
            },
            "lender": {
                "name": "Bank of England Plc",
                "address": {
                    "street-address": "12 Trinity Place",
                    "extended-address": "Regents Street",
                    "locality": "London",
                    "postal-code": "",
                },
                "company-no": "2347676",
            }}

        return MockJsonResponse(deed)
