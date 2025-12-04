import eel
eel.init("web")
import auth
import rooms
import questions
if __name__ == "__main__":
    eel.start("pages/index.html", port=8000, size=(1100, 650))
