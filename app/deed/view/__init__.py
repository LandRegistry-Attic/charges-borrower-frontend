from flask import Blueprint
from . import routes


def blueprint(deed_api_client):
    blueprint = Blueprint('deed.view', __name__)
    routes.register_routes(blueprint, deed_api_client)
    return blueprint
