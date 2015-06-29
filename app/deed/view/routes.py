from app.deed.view import views
from flask import request


def register_routes(blueprint, deed_api):
    @blueprint.route('/deed/view')
    def view_deed():
        deed_ref_num = request.args.get('deedRefNum')
        deed = deed_api.get_deed(deed_ref_num)
        return views.View(deed).render()

    @blueprint.route('/deed/not_found')
    def deed_not_found():
        return views.NotFound().render()
