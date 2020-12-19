from flask import render_template, request, session, jsonify, redirect
from app import app, login, utils, models
from app.admins import *
from app.models import User
from flask_login import login_user
from datetime import date, datetime, timedelta, time
import hashlib, json

from app.utils import get_list_ticket, list_ticket_in_cart, add_KhachHang


@app.route("/", methods=['GET', 'POST'])
def index():
    tinhThanh = utils.get_tinhThanh()
    list_fight = None
    if request.method != 'POST':
        return render_template("index.html", tinhThanh=tinhThanh)
    place_start = utils.get_tinhThanh_by_id(request.form.get('From'))
    place_end = utils.get_tinhThanh_by_id(request.form.get('To'))
    date_time_depart = request.form.get('departure')
    fight = utils.read_data_fight(place_start=request.form.get('From'), place_end=request.form.get('To'))
    isListTicketNone = True
    if fight:
        list_fight = utils.fight_detail_list(fight)
        for f in list_fight:
            if len(utils.list_ticket_by_type(f["id"])) > 0:
                for i in utils.list_ticket_by_type(f["id"]):
                    isListTicketNone = False
                    break

    return render_template('flight-list.html',
                           tinhThanh=tinhThanh,
                           fight=fight,
                           place_end=place_end,
                           place_start=place_start, \
                           date_time_depart=date_time_depart, list_fight=list_fight, utils=utils,
                           isListTicketNone=isListTicketNone)


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
    if id in cart:
        del cart[id]
    else:
        cart[id] = {
            "id": id,
            "name": name,
            "price": price,
            "quantity": 1
        }
    session['cart'] = cart
    quantity, amount = utils.cart_stats(cart)
    list_ticket = utils.list_ticket_in_cart(cart)
    return jsonify({
        "total_quantity": quantity,
        "total_amount": amount,
        "list_ticket": list_ticket,
    })


@app.route('/api/get-cart', methods=['GET'])
def cart():
    cart = session.get('cart')
    quantity, amount = utils.cart_stats(cart)
    list_ticket = utils.list_ticket_in_cart(cart)

    return jsonify({
        "total_quantity": quantity,
        "total_amount": amount,
        "list_ticket": list_ticket,
    })


@app.route("/book-seat/<int:flight_id>/<float:price>/<string:type>/<int:plane>")
def book_seat(flight_id, price, type, plane):
    tinhThanh = utils.get_tinhThanh()
    ticket = Ve.query.join(Ghe).filter(Ghe.mayBayId == plane, Ve.ve_chuyenbay == flight_id, Ghe.loaiGhe == type).all()
    len_ticket = len(ticket)
    print(len_ticket)
    col = int(len_ticket / 10)
    row = int(len_ticket / col)
    mapTicket = []
    x = 0
    for i in range(row):
        x * i
        mapTicket.append([])
        for j in range(col):
            mapTicket[i].append(ticket[x])
            x = x + 1
    return render_template("seat-book.html", tinhThanh=tinhThanh, mapTicket=mapTicket, \
                           len_ticket=len_ticket, col=col, row=row, utils=utils, price=price, type=type)


@app.route('/api/pay', methods=['post'])
def pay():
    data = json.loads(request.data)
    name = data.get("name")
    phone = data.get("phone")
    ic = data.get("ic")
    address = data.get("address")
    brithday = datetime.strptime(data.get("brithday"), "%Y-%m-%d")
    kh = KhachHang.query.filter(KhachHang.CMND == ic).all()
    if len(kh) > 0:
        cart = session.get('cart')
        list_ticket = utils.list_ticket_in_cart(cart)
        if len(list_ticket) > 0:
            for i in list_ticket:
                utils.update_ticket_seat(i["id"], kh)
            del session['cart']
            return jsonify({
                "mess": "Success"
            })
        return jsonify({
            "mess": "No tickets in the cart"
        })
    else:
        add_KhachHang(tenKhachHang=name, ngaySinh=brithday, diaChi=address, CMND=ic, soDienThoai=phone)
        kh = KhachHang.query.filter(KhachHang.CMND == ic).all()
        if len(kh) > 0:
            cart = session.get('cart')
            list_ticket = utils.list_ticket_in_cart(cart)
            if len(list_ticket) > 0:
                for i in list_ticket:
                    utils.update_ticket_seat(i["id"], kh)
                del session['cart']
                return jsonify({
                    "mess": "Success"
                })
        return jsonify({
            "mess": "No tickets in the cart"
        })


@app.route("/api/ticket", methods=['post'])
def update_ticket():
    data = json.loads(request.data)
    id_ticket = data.get("id_ticket")
    id_user = data.get("id_user")
    utils.issue_the_ticket(id_ticket=id_ticket, id_nhan_vien=id_user)
    return jsonify({
        "mess": "success"
    })


@app.route("/api/find-flight", methods=['post'])
def find_flight():
    data = json.loads(request.data)
    id_from = int(data.get("id_from"))
    id_to = int(data.get("id_to"))
    date = data.get("date")
    if date != "":
        mess = "Tìm Thấy Chuyến Bay Phù Hợp"
        date_time = datetime.strptime(date, "%Y-%m-%dT%H:%M")
        list_flight = utils.read_data_fight(place_start=id_from, place_end=id_to, date=date_time)
        list_flight_str = []
        for i in list_flight:
            x = utils.get_detail_fight(i.id)
            list_flight_str.append(x)
        if len(list_flight_str) <= 0:
            mess = "Không Có Chuyến Bay"
        return jsonify({
            "list_flight": list_flight_str,
            "mess": mess
        })
    else:
        mess = "Tìm Thấy Chuyến Bay Phù Hợp"
        list_flight = utils.read_data_fight(place_start=id_from, place_end=id_to, date=None)
        list_flight_str = []
        for i in list_flight:
            x = utils.get_detail_fight(i.id)
            list_flight_str.append(x)
        if len(list_flight_str) <= 0:
            mess = "Không Có Chuyến Bay"
        return jsonify({
            "list_flight": list_flight_str,
            "mess": mess
        })


@app.route("/api/list-seat", methods=['post'])
def get_list_seat():
    utils.remove_cart()
    data = json.loads(request.data)
    type = data.get("type")
    id_flight = int(data.get("id_flight"))
    id_plane = ChuyenBay.query.get(id_flight).mayBayId
    ticket = Ve.query.join(Ghe).filter(Ghe.mayBayId == id_plane, Ve.ve_chuyenbay == id_flight,
                                       Ghe.loaiGhe == type).all()
    list_ticket = utils.detail_list_ticket(ticket)
    mess = "Đã Tìm Thấy"
    if len(list_ticket) <= 0:
        mess = "Không Tìm Thấy Vé Phù Hợp"
    return jsonify({
        "list_ticket": list_ticket,
        "mess": mess
    })

@app.route("/api/get-info-customer", methods=['post'])
def info_customer():
    data = json.loads(request.data)
    ic = data.get("cmnd")
    ten = data.get("ten")
    sdt  = data.get("sdt")
    date = data.get("bd")
    kh = None
    if date!="":
        bd = datetime.strptime(date,"%Y-%m-%d")
        kh = utils.read_data_Kh(cmnd=ic,ngaySinh=bd,hoTen=ten,sdt=sdt)
    if kh!=None:
        mess = "Đã Tìm Thấy Thông Tin Khách Hàng"
        return jsonify({
        "id": kh.id,
        "ten":kh.tenKhachHang,
        "cmnd":kh.CMND,
        "sdt":kh.soDienThoai,
        "diaChi":kh.diaChi,
        "ngaySinh":str(kh.ngaySinh),
        "mess": mess,
    })
    else:
        return jsonify({
            "mess":"Không Tìm Thấy Khách Hàng"
        })

@app.route("/api/book-ticket",methods=["post"])
def book_ticket():
    data = json.loads(request.data)
    kh = int(data.get("id_kh"))
    nv = int(data.get("id_nhanVien"))
    cart = session.get('cart')
    list_ticket = utils.list_ticket_in_cart(cart)
    if len(list_ticket)>0:
        for tk in list_ticket:
            utils.book_seat_ticket(id_ticket=tk["id"],id_kh=kh,i_nhanvien=nv)
        del session['cart']
        return jsonify({
            "mess": "Đặt Vé Thành Công"
            })
    else:
        return jsonify({
            "mess": "Đặt Vé Thất Bại"
        })


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
    app.run(debug=True, port=400)
