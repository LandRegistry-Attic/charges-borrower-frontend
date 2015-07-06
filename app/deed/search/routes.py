from app.deed.search import views
from flask import redirect, url_for, request, current_app


def register_routes(blueprint):
    @blueprint.route('/deed/search', methods=['GET'])
    def search_deed():
        return views.Search().render()

    @blueprint.route('/deed/search', methods=['POST'])
    def redirect_to_view_deed():
        deed_ref_num = request.form['deedRefNumber']
        url = url_for('deed.view.view_deed', deedRefNum=deed_ref_num)
        response = current_app.make_response(redirect(url, code=303))
        response.set_cookie('borrower_id', value='1')
        response.set_cookie('deed_id', value='1')
        return response
