from app.deed.view import views
from app.service import deed_api
from flask import request, redirect, url_for
def register_routes(blueprint):

    @blueprint.route('/deed/view')
    def view_deed():
        deed_ref_num = request.args.get('deedRefNum')

        borrowers = deed_api.get_borrowers([deed_ref_num])
        if not borrowers:
            return redirect(url_for('deed.view.deed_not_found'))

        lender = deed_api.get_lender()
        land_property = deed_api.get_land_property()

        return views.View(borrowers, lender, land_property).render()

    @blueprint.route('/deed/not_found')
    def deed_not_found():
        return views.NotFound().render()
