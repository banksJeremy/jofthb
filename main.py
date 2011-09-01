from bottle import route, redirect, response, run, view
from google.appengine.api import users

@route("/")
@view("page")
def hello():
    user = users.get_current_user()
    
    if not user:
        redirect(users.create_login_url("/"))
    
    return {    
        "title": "Hello World",
        "email": user.email()
    }

run(server="gae")
