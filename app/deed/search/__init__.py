from flask import Blueprint
from . import routes, server

blueprint = Blueprint('search', __name__)
routes.register_routes(blueprint)
server.register_routes(blueprint)
