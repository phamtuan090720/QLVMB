from flask import render_template, request, redirect
from app import app, login, utils
from app.admins import *
from app.models import User
from flask_login import login_user
from datetime import date, datetime, timedelta, time
import hashlib


@app.route("/", methods=['GET', 'POST'])
def index():
    tinhThanh = utils.get_tinhThanh()
    list_fight = None
    if request.method != 'POST':
        return render_template("index.html", tinhThanh=tinhThanh)
    place_start = utils.get_tinhThanh_by_id(request.form.get('From'))
    place_end = utils.get_tinhThanh_by_id(request.form.get('To'))
    date_time_depart = request.form.get('departure')
    fight = ChuyenBay.query.all()
    if fight:
        list_fight = utils.fight_detail_list(fight)
    return render_template('air-ticket-list.html',
                           tinhThanh=tinhThanh,
                           fight=fight,
                           place_end=place_end,
                           place_start=place_start, date_time_depart=date_time_depart,list_fight=list_fight)


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
