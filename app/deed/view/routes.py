from app.deed.view import views
from flask import request, redirect, url_for, make_response


def register_routes(blueprint, deed_api):
    @blueprint.route('/deed/view')
    def view_deed():
        borrower_token = request.args.get('borrower_token')
        try:
            deed = deed_api.get_deed(borrower_token)
            views_page = views.View(deed).render()

            response = make_response(views_page)
            response.set_cookie('deed_id', str(deed.id))
            response.set_cookie('borrower_id', str(deed.signing_borrower_id))

            return response
        except ValueError:
            return redirect(url_for('deed.view.deed_not_found'))

    @blueprint.route('/deed/not_found')
    def deed_not_found():
        return views.NotFound().render()
