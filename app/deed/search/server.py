from flask import redirect

def register_routes(blueprint):
    @blueprint.route('/deed/search', methods=['POST'])
    def redirect_to_view_deed():
        return redirect("/deed/view", code=303)
