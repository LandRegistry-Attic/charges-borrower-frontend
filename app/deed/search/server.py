from flask import redirect

def register_routes(blueprint):
    @blueprint.route('/deed/search', methods=['POST'])
    def get_title():

        return redirect("/deed/view", code=302)
