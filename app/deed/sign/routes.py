from app.deed.sign import views
from flask import redirect, url_for, request, abort


def register_routes(blueprint, scribe_api, deed_api):
    @blueprint.route('/deed/sign/confirmation', methods=['GET'])
    def confirmation():
        return views.Confirmation().render()

    @blueprint.route('/deed/sign', methods=['POST'])
    def sign_deed():
        borrower_id = request.cookies.get('borrower_id')
        deed_id = request.cookies.get('deed_id')
        borrower_name = request.form['borrowerName']

        response = scribe_api.sign_deed(deed_id, borrower_id, borrower_name)

        if response.status_code == 200:
            signed_details = deed_api.get_signed_status(deed_id)
            views_page = views.View(signed_details).render()

            response = make_response(views_page)
            return redirect(url_for('deed.sign.confirmation'), code=303)
        else:
            abort(response.status_code)
