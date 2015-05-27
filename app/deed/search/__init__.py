from flask import Blueprint
from . import routes

blueprint = Blueprint('deed.search', __name__)
routes.register_routes(blueprint)
