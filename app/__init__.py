from flask import Flask
from flask.ext.script import Manager
from govuk_template.flask import assets

from app import helloworld, static
from app.deed import search, view, sign
from app.service import deed_api


def create_manager():
    app = Flask(__name__)
    app.config.from_pyfile('config.py')

    manager = Manager(app)

    static.register_assets(app)

    deed_api_client = deed_api.make_client()

    app.register_blueprint(helloworld.blueprint)
    app.register_blueprint(search.blueprint)
    app.register_blueprint(view.blueprint(deed_api_client))
    app.register_blueprint(sign.blueprint)
    app.register_blueprint(assets.govuk_template, url_prefix='/template')

    return manager
