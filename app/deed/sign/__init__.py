from flask import Blueprint
from . import routes


def blueprint(scribe_api_client):
    blueprint = Blueprint('deed.sign', __name__)
    routes.register_routes(blueprint, scribe_api_client)
    return blueprint
