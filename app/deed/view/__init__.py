from flask import Blueprint
from . import routes

blueprint = Blueprint('deed.view', __name__)
routes.register_routes(blueprint)
