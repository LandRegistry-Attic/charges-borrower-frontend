from app.deed.search import views
from flask import redirect, url_for


def register_routes(blueprint):
    @blueprint.route('/deed/search', methods=['GET'])
    def search_deed():
        return views.Search().render()

    @blueprint.route('/deed/search', methods=['POST'])
    def redirect_to_view_deed():
        return redirect(url_for('deed.view.view_deed'), code=303)
