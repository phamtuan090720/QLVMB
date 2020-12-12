from app import db
from app.models import *
from sqlalchemy import or_, and_,join,subquery
from datetime import datetime,date,time,timedelta

def get_user_by_id(user_id):
    return User.query.get(user_id)


def get_tuyenBay_by_id(id):
    return TuyenBay.query.get(id)


def get_tinhThanh():
    return TinhThanh.query.all()


def get_tinhThanh_by_id(id):
    return TinhThanh.query.get(id)

def get_sanBay_by_id(id):
    return SanBay.query.get(id)

def read_data_tuyenBay(place_start=None, place_end=None):
    tuyenBay = TuyenBay.query
    if place_start and place_end:
        tuyenBay = tuyenBay.filter((TuyenBay.sanbayDi == place_start, TuyenBay.sanbayDen == place_end))
        return tuyenBay.all()
    return None

def read_data_ticket():
  pass


def read_data_fight(place_start=None, place_end=None):
    if place_start and place_end:

        tuyenBay = read_data_tuyenBay(place_start, place_end)
        if len(tuyenBay):
            for i in tuyenBay:
                chuyenBay = ChuyenBay.query.filter(ChuyenBay.tuyenBayId == i.id)
                return chuyenBay.all()
def read_data_SanBay(tinhThanh=None,tenSanBay=None):
    sanBay=SanBay.query
    if tinhThanh:
        sanBay = sanBay.filter(SanBay.tinhThanh == tinhThanh)
    if tenSanBay:
        sanBay = sanBay.filter(SanBay.tenSanBay == tenSanBay)
    return sanBay.all()

#
# a = read_data_tuyenBay(4,1)
# print(a[0].sanbayDi)
# print(get_sanBay_by_id(a[0].sanbayDi).tenSanBay)
# b = read_data_SanBay(tinhThanh=2)
# print(b)
# rote_fight = []
# for rf in b:
#
# # timedelta(hours=5,minutes=30)
# # print(datetime.now() + timedelta(hours=5,minutes=30))
# a = time(1,30)
#
# print(datetime.now().time().minute)
def get_mayBay_by_id(id):
    return MayBay.query.get(id)
def fight_detail_list(list_fight):

    detail_fight_list = []
    for i in list_fight:
        detail_fight = {
            "id": i.id,
            "thoiGianBay":i.thoiGianBay,
            "thoiDiemKhoiHanh":i.thoiDiemKhoiHanh,
            "thoiDiemHaCanh":i.thoiDiemKhoiHanh + timedelta(hours=i.thoiGianBay.hour,minutes=i.thoiGianBay.minute),
            "sanBayDi": get_sanBay_by_id(get_tuyenBay_by_id(i.tuyenBayId).sanbayDi).tenSanBay,
            "sanBayDen": get_sanBay_by_id(get_tuyenBay_by_id(i.tuyenBayId).sanbayDen).tenSanBay,
            "tinhThanhDi": get_tinhThanh_by_id(get_sanBay_by_id(get_tuyenBay_by_id(i.tuyenBayId).sanbayDi).tinhThanh).tenTinhThanh,
            "tinhThanhDen": get_tinhThanh_by_id(get_sanBay_by_id(get_tuyenBay_by_id(i.tuyenBayId).sanbayDen).tinhThanh).tenTinhThanh,
            "mayBay": get_mayBay_by_id(i.mayBayId).maMayBay
        }
        detail_fight_list.append(detail_fight)
    return detail_fight_list
for i in TinhThanh.query.all():
    print(i.id)
    print(i.tenTinhThanh)
sanbayDi = SanBay.query.join(TinhThanh).filter(TinhThanh.id == 10).all()
sanBayDen =  SanBay.query.join(TinhThanh).filter(TinhThanh.id == 2).all()
idsbdi = sanbayDi[0].id
idsbde = sanBayDen[0].id
print(idsbde)
print(idsbdi)
# tb = TuyenBay.
# for i in c:
#     print(get_sanBay_by_id(i.sanbayDi))
#     print(get_sanBay_by_id(i.sanbayDen))
a = ChuyenBay.query.all()
b = fight_detail_list(a)
for i in b:
    print(i["sanBayDi"] + "->"+ i["sanBayDen"])
    print(i["tinhThanhDi"]+"->"+i["tinhThanhDen"])
    print(i["mayBay"])
