import requests
from app import config

SCRIBE_API_BASE_HOST = config.SCRIBE_API_BASE_HOST


def sign_deed(deed_id, borrower_id, borrower_name):
    json_body = {"borrower_name": borrower_name}
    url = SCRIBE_API_BASE_HOST + "/deed/" + deed_id + "/" + borrower_id + "/" + "signature"
    return requests.post(url, json=json_body)
