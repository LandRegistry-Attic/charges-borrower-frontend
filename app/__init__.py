from flask import Flask
from flask.ext.script import Manager
from govuk_template.flask import assets

from app import helloworld, static
from app.deed import search, view, sign


def create_manager():
    app = Flask(__name__)
    app.config.from_pyfile('config.py')

    manager = Manager(app)

    static.register_assets(app)

    app.register_blueprint(helloworld.blueprint)
    app.register_blueprint(search.blueprint)
    app.register_blueprint(view.blueprint)
    app.register_blueprint(sign.blueprint)
    app.register_blueprint(assets.govuk_template, url_prefix='/template')

    return manager
