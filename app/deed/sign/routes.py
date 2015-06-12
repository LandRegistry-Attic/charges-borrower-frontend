from app.deed.sign import views
from flask import redirect, url_for


def register_routes(blueprint):

    @blueprint.route('/deed/sign/confirmation', methods=['GET'])
    def confirmation():
        return views.Confirmation().render()

    @blueprint.route('/deed/sign', methods=['POST'])
    def sign_deed():
        return redirect(url_for('deed.sign.confirmation'), code=303)
