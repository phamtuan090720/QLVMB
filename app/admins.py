from flask import redirect
from app import admin, db
from flask_admin.contrib.sqla import ModelView
from  app.models import SanBay,MayBay,TuyenBay,User,KhanhHang
from flask_admin import BaseView, expose
from flask_login import current_user,logout_user

class ContactView(BaseView):
    @expose('/')
    def index(self):
        return self.render('admin/contact.html')

    def is_accessible(self):
        return current_user.is_authenticated
class LogoutView(BaseView):
    @expose('/')
    def index(self):
        logout_user()
        return redirect('/admin')
    def is_accessible(self):
        return current_user.is_authenticated
class AuthenticatedView(ModelView):
    def is_accessible(self):
        return current_user.is_authenticated
class UserModelView(AuthenticatedView):
    column_display_pk = True
    can_create = True
    can_edit = True
    can_export = True
class SanBayModelView(AuthenticatedView):
    column_display_pk = True
    can_create = True
    can_edit = True
    can_export = True
class TuyenBayModelView(AuthenticatedView):
    column_display_pk = True
    can_create = True
    can_edit = True
    can_export = True
class MayBayModelView(AuthenticatedView):
    column_display_pk = True
    can_create = True
    can_edit = True
    can_export = True
class KhanhHangModelView(AuthenticatedView):
    column_display_pk = True
    can_create = True
    can_edit = True
    can_export = True
admin.add_view(UserModelView(User,db.session))
admin.add_view(SanBayModelView(SanBay, db.session))
admin.add_view(TuyenBayModelView(TuyenBay, db.session))
admin.add_view(MayBayModelView(MayBay, db.session))
admin.add_view(KhanhHangModelView(KhanhHang, db.session, name='Khách Hàng'))
# admin.add_view(ModelView(TuyenBay, db.session, name='Tuyến Bay'))
# # admin.add_view(ModelView(ChuyenBay, db.session, name='Chuyến Bay'))

admin.add_view(ContactView(name='Liên hệ'))
admin.add_view(LogoutView(name="Đăng xuất"))

