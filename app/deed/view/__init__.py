from flask import Blueprint
from . import routes

blueprint = Blueprint('view', __name__)
routes.register_routes(blueprint)
