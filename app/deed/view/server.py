from flask import redirect

def register_routes(blueprint):
    @blueprint.route('/deed/view', methods=['GET'])
    def get_title():

        return redirect("/deed/view", code=303)

