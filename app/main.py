from flask import render_template, request, session, jsonify, redirect
from app import app, login, utils,models
from app.admins import *
from app.models import User
from flask_login import login_user
from datetime import date, datetime, timedelta, time
import hashlib,json

from app.utils import get_list_ticket


@app.route("/", methods=['GET', 'POST'])
def index():
    tinhThanh = utils.get_tinhThanh()
    list_fight = None
    if request.method != 'POST':
        return render_template("index.html", tinhThanh=tinhThanh)
    place_start = utils.get_tinhThanh_by_id(request.form.get('From'))
    place_end = utils.get_tinhThanh_by_id(request.form.get('To'))
    date_time_depart = request.form.get('departure')
    fight = utils.read_data_fight(request.form.get('From'),request.form.get('To'))
    isListTicketNone = True
    if fight:
        list_fight = utils.fight_detail_list(fight)
        for f in list_fight:
            if len(utils.list_ticket_by_type(f["id"]))>0:
                for i in utils.list_ticket_by_type(f["id"]):
                        isListTicketNone = False
                        break

    return render_template('flight-list.html',
                           tinhThanh=tinhThanh,
                           fight=fight,
                           place_end=place_end,
                           place_start=place_start,\
                           date_time_depart=date_time_depart,list_fight=list_fight,utils=utils,isListTicketNone=isListTicketNone)


@login.user_loader
def user_load(user_id):
    return utils.get_user_by_id(user_id=user_id)
@app.route('/api/cart', methods=['post'])
def add_to_cart():
    if 'cart' not in session:
        session['cart'] = {}

    cart = session['cart']

    data = json.loads(request.data)

    id = str(data.get("id"))
    name = data.get("name")
    price = data.get("price", 0)
    list_ticket = []
    if id in cart:
        del cart[id]
        list_ticket.remove(cart[id]["name"])
    else:
        cart[id] = {
            "id": id,
            "name": name,
            "price": price,
            "quantity" : 1
        }
        list_ticket.append(cart[id]["name"])

    session['cart'] = cart
    quantity, amount = utils.cart_stats(cart)
    return jsonify({
        "total_quantity": quantity,
        "total_amount": amount,
        "list_ticket" : list_ticket,
    })
@app.route("/book-seat")
def book_seat():
    tinhThanh = utils.get_tinhThanh()
    ticket = Ve.query.all()
    len_ticket = len(ticket)
    col = int(len_ticket/10)+1
    return render_template("seat-book.html",tinhThanh=tinhThanh,ticket=ticket,len_ticket=len_ticket,col=col,utils=utils)


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
