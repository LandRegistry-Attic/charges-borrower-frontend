from app.deed.search import views


def register_routes(blueprint):
    @blueprint.route('/deed/search')
    def search_deed():
        return views.Search().render()
