from flask import Flask
from flask.ext.script import Manager
from govuk_template.flask import assets

from app import helloworld, static
from app.deed import search, view, sign
from app.service.deed_api import make_deed_client
from app.service.scribe_api import make_scribe_client


def create_manager(deed_api_client=make_deed_client,
                   scribe_api_client=make_scribe_client):
    app = Flask(__name__)
    app.config.from_pyfile('config.py')

    manager = Manager(app)
    static.register_assets(app)

    app.register_blueprint(helloworld.blueprint)
    app.register_blueprint(search.blueprint)
    app.register_blueprint(view.blueprint(deed_api_client()))
    app.register_blueprint(sign.blueprint(scribe_api_client()))
    app.register_blueprint(assets.govuk_template, url_prefix='/template')

    return manager
