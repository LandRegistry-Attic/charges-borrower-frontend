from flask import Blueprint
from . import routes, server

blueprint = Blueprint('view', __name__)
routes.register_routes(blueprint)
server.register_routes(blueprint)
