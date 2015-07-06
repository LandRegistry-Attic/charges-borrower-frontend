import requests
from app import config

SCRIBE_API_BASE_HOST = config.SCRIBE_API_BASE_HOST


def sign_deed(deed_id, borrower_id, borrower_name):
    json_body = {"deed_id": deed_id,
                 "borrower_id": borrower_id,
                 "borrower_name": borrower_name}
    url = SCRIBE_API_BASE_HOST + "/deed/signature"
    return requests.post(url, json=json_body)
