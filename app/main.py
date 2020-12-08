from flask import render_template, request, redirect
from app import app, login, utils
from app.admins import *
from app.models import User
from flask_login import login_user
import hashlib


@app.route("/")
def index():
    return render_template("index.html")


@login.user_loader
def user_load(user_id):
    return utils.get_user_by_id(user_id=user_id)




@app.route("/login-admin", methods=['GET', 'POST'])
def login_admin():
    if request.method == 'POST':
        username = request.form.get("username")
        password = request.form.get("password", "")
        password = str(hashlib.md5(password.strip().encode("utf-8")).hexdigest())
        user = User.query.filter(User.username == username, User.password == password).first()
        if user:
            login_user(user=user)
        return redirect("/admin")


if __name__ == "__main__":
    app.run(debug=True)
