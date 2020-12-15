from app import db
from app.models import *
from sqlalchemy import or_, and_, join, subquery
from datetime import datetime, date, time, timedelta


def get_user_by_id(user_id):
    return User.query.get(user_id)


def get_ChuyenBay_by_id(ChuyenBay_id):
    return ChuyenBay.query.get(ChuyenBay_id)


def get_tuyenBay_by_id(id):
    return TuyenBay.query.get(id)


def get_tinhThanh():
    return TinhThanh.query.all()


def get_tinhThanh_by_id(id):
    return TinhThanh.query.get(id)


def get_sanBay_by_id(id):
    return SanBay.query.get(id)


def read_data_ticket(id_ChuyenBay=None):
    ticket_list = Ve.query
    if id_ChuyenBay:
        ticket_list = ticket_list.filter(Ve.ve_chuyenbay == id_ChuyenBay)
        return ticket_list.all()
    else:
        return ticket_list


def get_ghe_by_id(id):
    return Ghe.query.get(id)


def get_mayBay_by_id(id):
    return MayBay.query.get(id)


def fight_detail_list(list_fight):
    detail_fight_list = []
    for i in list_fight:
        detail_fight = {
            "id": i.id,
            "thoiGianBay": i.thoiGianBay,
            "thoiDiemKhoiHanh": i.thoiDiemKhoiHanh,
            "thoiDiemHaCanh": i.thoiDiemKhoiHanh + timedelta(hours=i.thoiGianBay.hour, minutes=i.thoiGianBay.minute),
            "sanBayDi": get_sanBay_by_id(get_tuyenBay_by_id(i.tuyenBayId).sanbayDi).tenSanBay,
            "sanBayDen": get_sanBay_by_id(get_tuyenBay_by_id(i.tuyenBayId).sanbayDen).tenSanBay,
            "tinhThanhDi": get_tinhThanh_by_id(
                get_sanBay_by_id(get_tuyenBay_by_id(i.tuyenBayId).sanbayDi).tinhThanh).tenTinhThanh,
            "tinhThanhDen": get_tinhThanh_by_id(
                get_sanBay_by_id(get_tuyenBay_by_id(i.tuyenBayId).sanbayDen).tinhThanh).tenTinhThanh,
            "mayBay": get_mayBay_by_id(i.mayBayId).maMayBay
        }
        detail_fight_list.append(detail_fight)
    return detail_fight_list


def read_data_tuyenBay(place_start=None, place_end=None):
    if place_start and place_end:
        sanbayDi = SanBay.query.join(TinhThanh).filter(TinhThanh.id == place_start).all()[0].id
        sanBayDen = SanBay.query.join(TinhThanh).filter(TinhThanh.id == place_end).all()[0].id
        tuyenBay = TuyenBay.query.filter(TuyenBay.sanbayDi == sanbayDi, TuyenBay.sanbayDen == sanBayDen).all()
        return tuyenBay
    return None


def read_data_fight(place_start=None, place_end=None):
    if place_start and place_end:
        tuyenBay = read_data_tuyenBay(place_start, place_end)
        if len(tuyenBay):
            for i in tuyenBay:
                chuyenBay = ChuyenBay.query.filter(ChuyenBay.tuyenBayId == i.id)
                return chuyenBay.all()


def get_ticket_nomal(id_chuyenBay):
    ticket_nomal = Ve.query.join(ChuyenBay, Ghe).filter(ChuyenBay.id == id_chuyenBay, Ghe.loaiGhe == "Thường",
                                                        Ghe.trangThai == "Chưa Đặt").all()
    return ticket_nomal


def get_ticket_vip(idChuyenBay):
    ticket_vip = Ve.query.join(ChuyenBay, Ghe, MayBay) \
        .filter(ChuyenBay.id == idChuyenBay, Ghe.loaiGhe == "Vip", Ghe.trangThai == "Chưa Đặt") \
        .all()
    return ticket_vip


def get_list_mayBay(id_chuyenbay):
    if get_ChuyenBay_by_id(id_chuyenbay):
        return MayBay.query.join((ChuyenBay)).filter(ChuyenBay.mayBayId).all()


def get_ticket_vip_test(idMayBay, idChuyenBay):
    ticket_vip = Ve.query.join(ChuyenBay, Ghe, MayBay) \
        .filter(MayBay.id == idMayBay, Ghe.loaiGhe == "Vip", Ghe.trangThai == "Chưa Đặt", ChuyenBay.id == idChuyenBay) \
        .all()
    return ticket_vip


def get_ticket_normal_test(id_mayBay, idChuyenBay):
    ticket_vip = Ve.query.join(ChuyenBay, Ghe, MayBay) \
        .filter(MayBay.id == id_mayBay, Ghe.loaiGhe == "Normal", Ghe.trangThai == "Chưa Đặt",
                ChuyenBay.id == idChuyenBay) \
        .all()
    return ticket_vip


def list_ticket_by_type(id_ChuyenBay):
    list_plant = get_list_mayBay(id_ChuyenBay)
    list_ticket_type = []
    if len(list_plant) > 0:
        for i in list_plant:
            ticket_vip = get_ticket_vip_test(i.id, id_ChuyenBay)
            ticket_nomal = get_ticket_normal_test(i.id, id_ChuyenBay)
            if len(ticket_vip) > 0:
                list_ticket_type.append(ticket_vip[0])
            if len(ticket_nomal):
                list_ticket_type.append(ticket_nomal[0])
    return list_ticket_type


def detail_list_ticket(list):
    list_detail_ticket = []
    if list:
        for i in list:
            detail_ticket = {
                "id": i.id,
                "loaiGhe": get_ghe_by_id(i.id).loaiGhe,
                "gia": i.gia,
                "mayBay": get_mayBay_by_id(get_ghe_by_id(i.id).mayBayId).maMayBay
            }
            list_detail_ticket.append(detail_ticket)
    return list_detail_ticket


def cart_stats(cart):
    total_amount, total_quantity = 0, 0
    if cart:
        for p in cart.values():
            total_quantity = total_quantity + p["quantity"]
            total_amount = total_amount + p["quantity"] * p["price"]

    return total_quantity, total_amount


def get_list_ticket():
    return Ve.query.all()


a = MayBay.query.all()
print(a)
