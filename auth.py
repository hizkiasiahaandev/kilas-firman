import eel

@eel.expose
def register_user(username, email, password):
    return {
        "success": True,
        "user": {
            "username": username,
            "email": email,
            "password": password
        }
    }

@eel.expose
def login_user(email, password):
    return {
        "success": True,
        "user": {
            "username": email.split("@")[0],
            "email": email,
            "password": password
        }
    }
