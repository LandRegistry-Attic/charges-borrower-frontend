from flask import current_app
import requests

DEED_API_BASE_HOST = current_app.config['DEED_API_BASE_HOST']


class DeedApiClient:
    @staticmethod
    def get_deed(md_ref):
        return requests.get(DEED_API_BASE_HOST + '/deed/' + str(md_ref))
