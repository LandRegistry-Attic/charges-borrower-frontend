from app.deed.view import views
from app.service import deed_api

def register_routes(blueprint):

    @blueprint.route('/deed/view')
    def view_deed():
        # handle non existing deed
        # return redirect('/deed/not_found', 303)
        borrowers = deed_api.get_borrowers()
        lender = deed_api.get_lender()
        land_property = deed_api.get_land_property()
        return views.View(borrowers, lender, land_property).render()

    @blueprint.route('/deed/not_found')
    def deed_not_found():
        return views.NotFound().render()
