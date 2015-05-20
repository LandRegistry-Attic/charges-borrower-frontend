from app.deed.search import views


def register_routes(blueprint):
    @blueprint.route('/deed/search')
    def search_deed():
        # res = requests.get("https://api.github.com/users/gogglesguy")
        # print(res.json().get('bio'))
        return views.Search().render()
