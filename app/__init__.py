from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin
from flask_login import LoginManager

app = Flask(__name__)
app.secret_key="\x85\xef\x1a\x8b8\xae\xaab\xf5\x18PT)\xa7(\x0b"
app.config["SQLALCHEMY_DATABASE_URI"] ="mysql+pymysql://root:123456789@localhost/qlbanvemaybay?charset=utf8mb4"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True
db = SQLAlchemy(app=app)
admin = Admin(app=app, name="QUAN LY VE MAY BAY", template_mode="bootstrap4")
login = LoginManager(app=app)


