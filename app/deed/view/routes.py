from app.deed.view import views
from flask import request, redirect, url_for


def register_routes(blueprint, deed_api):
    @blueprint.route('/deed/view')
    def view_deed():
        borrower_token = request.args.get('borrower_token')
        try:
            deed = deed_api.get_deed(borrower_token)
            return views.View(deed).render()
        except ValueError:
            return redirect(url_for('deed.view.deed_not_found'))

    @blueprint.route('/deed/not_found')
    def deed_not_found():
        return views.NotFound().render()
