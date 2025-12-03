# main.py
import eel
import auth

eel.init("web")

if __name__ == "__main__":
    eel.start(
        "pages/index.html",
        size=(1100, 650)
    )
