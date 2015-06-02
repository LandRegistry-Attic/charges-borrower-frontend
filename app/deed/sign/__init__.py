from flask import Blueprint
from . import routes

blueprint = Blueprint('deed.sign', __name__)
routes.register_routes(blueprint)
