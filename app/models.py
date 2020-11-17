from sqlalchemy import Column, Integer, Float, String, ForeignKey, Boolean, Date, Enum,DateTime,Time
from sqlalchemy.orm import relationship
from flask_login import UserMixin
from app import db
from app import admin
from datetime import datetime
# from enum import Enum as UserEnum
#
# class UserRole(UserEnum):
#     USER = 1
#     ADMIN = 2
class QLBVMB(db.Model):
    __abstract__ = True

    id = Column(Integer, primary_key=True, autoincrement=True)

class User(db.Model,UserMixin):
    __tablename__="user"
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50),nullable=False)
    active = Column(Boolean,default=True)
    username = Column(String(50), nullable=False)
    password = Column(String(50), nullable=False)
    email = Column(String(50),nullable=False)
    sdt = Column(String(20),nullable=False)
    def __str__(self):
        return self.name
class MayBay(QLBVMB):
    __tablename__ = "maybay"
    tenMb = Column(String(50),nullable=False)
    soGheHang1 = Column(Integer)
    soGheHang2 = Column(Integer)
    def __str__(self):
        return self.tenMb
#     chuyenbay =  relationship('ChuyenBay',backref="maybay",lazy=True)
class SanBay(QLBVMB):
    __tableanme__="sanbay"
    tenSb = Column(String(50),nullable=False)
    tinhThanh = Column(String(50),nullable=False)
    tuyenbays = relationship('TuyenBay',backref='sanbay',lazy=True)

    def __str__(self):
        return self.tenSb
class TuyenBay(QLBVMB):
    __tablename__="tuyenbay"
    sanBayDi=Column(String(50),nullable=False)
    sanBayDen=Column(String(50),nullable=False)
    sanbay_id = Column(Integer,ForeignKey(SanBay.id),nullable=False)
# # class ChuyenBay(db.Model):
# #     __tablename__="chuyenbay"
# #     maChuyenBay = Column(Integer,primary_key=True,nullable=False,autoincrement=True)
# #     maTuyen = Column(Integer,ForeignKey(TuyenBay.maTuyen),nullable=False)
# #     maMb = Column(Integer,ForeignKey(MayBay.maMb),nullable=False)
# #     ngayGio = Column(DateTime)
# #     thoiGianBay = Column(Time)
# #     soGheTrong = Column(Integer)
# #     def __str__(self):
# #         return self.name
class KhanhHang(db.Model):
    __tablename__="khachhang"
    maKH = Column(Integer,primary_key=True,nullable=False,autoincrement=True)
    tenKH = Column(String(50),nullable=False)
    diaChi = Column(String(50),nullable=False)
    CMND = Column(String(20),nullable=False)
    SoDT = Column(String(15),nullable=False)
if __name__ == '__main__':
    db.create_all()