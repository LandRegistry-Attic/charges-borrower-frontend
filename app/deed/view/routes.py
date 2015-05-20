from app.deed.view import views
import requests

def register_routes(blueprint):
    @blueprint.route('/deed/view')
    def search_deed():
        response = requests.get("http://localhost:5050/get-borrower/1")

        return views.View(response.json()).render()
