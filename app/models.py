from sqlalchemy import Column, Integer, Float, String, ForeignKey, Boolean, Date, Enum, DateTime, Time
from sqlalchemy.orm import relationship
# from app import admin
from datetime import datetime, date
from flask_login import UserMixin
from app import db
from enum import Enum as UserEnum


class UserRole(UserEnum):
    USER = 1
    ADMIN = 2


class QLBVMB(db.Model):
    __abstract__ = True
    id = Column(Integer, primary_key=True, autoincrement=True)


class User(db.Model, UserMixin):
    __tablename__ = "user"
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)
    active = Column(Boolean, default=True)
    username = Column(String(50), nullable=False)
    password = Column(String(50), nullable=False)
    email = Column(String(50), nullable=False)
    sdt = Column(String(20), nullable=False)
    user_role = Column(Enum(UserRole), default=UserRole.USER)
    ve_nhanvien = relationship("Ve", backref="Nhân Viên Xuất Vé", lazy=True)

    def __str__(self):
        return self.name


class KhachHang(QLBVMB):
    __tablename__ = "khachHang"
    tenKhachHang = Column(String(50), nullable=False)
    ngaySinh = Column(Date, nullable=False)
    diaChi = Column(String(50), nullable=False)
    CMND = Column(String(50), nullable=False)
    soDienThoai = Column(String(50), nullable=False)
    ve_khachhang = relationship("Ve", backref="Tên Khách Hàng", lazy=True)

    def __str__(self):
        return self.tenKhachHang


class TinhThanh(QLBVMB):
    __tablename__ = "tinhThanh"
    tenTinhThanh = Column(String(50), nullable=False)
    sanBay = relationship("SanBay", backref="Tỉnh Thành", lazy=True)

    def __str__(self):
        return self.tenTinhThanh


class SanBay(QLBVMB):
    __tablename__ = "sanBay"
    tenSanBay = Column(String(50), nullable=False)
    tinhThanh = Column(Integer, ForeignKey(TinhThanh.id), nullable=False)
    chuyenBay_SanBayDi = relationship("TuyenBay", backref="Sân Bay Đi", lazy=True, foreign_keys='TuyenBay.sanbayDi')
    chuyenBay_SanBayDen = relationship("TuyenBay", backref="Sân Bay Đến", lazy=True,
                                       foreign_keys='TuyenBay.sanbayDen')
    sanBayChuyChuyen = relationship("SanBayChungChuyen",backref="sân bay chờ",lazy=True)
    def __str__(self):
        return self.tenSanBay


class TuyenBay(QLBVMB):
    __tablename__ = "tuyenBay"
    sanbayDi = Column(Integer, ForeignKey(SanBay.id), nullable=False)
    sanbayDen = Column(Integer, ForeignKey(SanBay.id), nullable=False)
    chuyenBay_TuyenBay = relationship("ChuyenBay", backref="Tuyến Bay", lazy=True)

class MayBay(QLBVMB):
    __tablename__ = "mayBay"
    maMayBay = Column(String(50), nullable=False)
    gheMayBay = relationship("Ghe", backref="Máy Bay", lazy=True, foreign_keys="Ghe.mayBayId")
    chuyenBay_mayBay = relationship("ChuyenBay",backref="Máy Bay",lazy=True)

    def __str__(self):
        return self.maMayBay


class ChuyenBay(QLBVMB):
    __tablename__ = "chuyenBay"
    thoiDiemKhoiHanh = Column(DateTime, nullable=False)
    thoiGianBay = Column(Time, nullable=False)
    tuyenBayId = Column(Integer, ForeignKey(TuyenBay.id), nullable=False)
    mayBayId = Column(Integer,ForeignKey(MayBay.id),nullable=False)
    ve_chuyenBay = relationship("Ve", backref="Chuyến Bay", lazy=True)
    chuyenBay_SanBayChungChuyen = relationship("SanBayChungChuyen",backref="Chuyến Bay Chờ",lazy=True)

class SanBayChungChuyen(QLBVMB):
    __tablename__ = "sanBayChungChuyen"
    thoiGianDung = Column(Time,nullable=False)
    ghiChu = Column(String(250))
    chuyenBayId = Column(Integer,ForeignKey(ChuyenBay.id),nullable=False)
    sanBayId = Column(Integer,ForeignKey(SanBay.id),nullable=False)

class Ghe(QLBVMB):
    __tablename__ = "ghe"
    maGhe = Column(String(50), nullable=False)
    loaiGhe = Column(Enum("Vip", "Thường"), nullable=False)
    trangThai = Column(Enum("Đã Đặt", "Chưa Đặt"), nullable=False, default="Chưa Đặt")
    mayBayId = Column(Integer, ForeignKey(MayBay.id), nullable=False)
    ve_ghe = relationship('Ve', backref='Ghế', uselist=False)

    def __str__(self):
        return self.maGhe


class Ve(db.Model):
    __tablename__ = "ve"
    # maVe = Column(String(50), nullable=True)
    id = Column(Integer, ForeignKey(Ghe.id), nullable=False, primary_key=True)
    ve_khachHang = Column(Integer, ForeignKey(KhachHang.id), nullable=False)
    ve_nhanvien = Column(Integer, ForeignKey(User.id), nullable=False)
    ve_chuyenbay = Column(Integer, ForeignKey(ChuyenBay.id), nullable=False)
    ngayXuatVe = Column(DateTime, default=datetime.today())
    gia = Column(Integer)


#
#
# class MayBay(QLBVMB):
#     __tablename__ = "maybay"
#     tenMb = Column(String(50), nullable=False)
#     soGheHang1 = Column(Integer)
#     soGheHang2 = Column(Integer)
#
#     def __str__(self):
#         return self.tenMb
#
#
# #     chuyenbay =  relationship('ChuyenBay',backref="maybay",lazy=True)
# class SanBay(QLBVMB):
#     __tableanme__ = "sanbay"
#     tenSb = Column(String(50), nullable=False)
#     tinhThanh = Column(String(50), nullable=False)
#     tuyenbays = relationship('TuyenBay', backref='sanbay', lazy=True)
#
#     def __str__(self):
#         return self.tenSb
# class TuyenBay(QLBVMB):
#     __tablename__ = "tuyenbay"
#     sanBayDi = Column(String(50), nullable=False)
#     sanBayDen = Column(String(50), nullable=False)
#     sanbay_id = Column(Integer, ForeignKey(SanBay.id), nullable=False)
#
#
# # # class ChuyenBay(db.Model):
# # #     __tablename__="chuyenbay"
# # #     maChuyenBay = Column(Integer,primary_key=True,nullable=False,autoincrement=True)
# # #     maTuyen = Column(Integer,ForeignKey(TuyenBay.maTuyen),nullable=False)
# # #     maMb = Column(Integer,ForeignKey(MayBay.maMb),nullable=False)
# # #     ngayGio = Column(DateTime)
# # #     thoiGianBay = Column(Time)
# # #     soGheTrong = Column(Integer)
# # #     def __str__(self):
# # #         return self.name
# class KhanhHang(db.Model):
#     __tablename__ = "khachhang"
#     maKH = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
#     tenKH = Column(String(50), nullable=False)
#     diaChi = Column(String(50), nullable=False)
#     CMND = Column(String(20), nullable=False)
#     SoDT = Column(String(15), nullable=False)


if __name__ == '__main__':
    db.create_all()
