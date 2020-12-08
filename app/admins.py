from flask import redirect
from app import admin, db
from flask_admin.contrib.sqla import ModelView
from flask_admin.contrib.fileadmin import FileAdmin
from app.models import SanBay, MayBay, User, ChuyenBay, KhachHang,Ghe,Ve,TuyenBay,TinhThanh
from flask_admin import BaseView, expose
from flask_login import current_user, logout_user


class AdminLTEModelView(ModelView):
    list_template = 'flask-admin/model/list.html'
    create_template = 'flask-admin/model/create.html'
    edit_template = 'flask-admin/model/edit.html'
    details_template = 'flask-admin/model/details.html'

    create_modal_template = 'flask-admin/model/modals/create.html'
    edit_modal_template = 'flask-admin/model/modals/edit.html'
    details_modal_template = 'flask-admin/model/modals/details.html'

class AdminLTEFileAdmin(FileAdmin):
    list_template = 'flask-admin/file/list.html'

    upload_template = 'flask-admin/file/form.html'
    mkdir_template = 'flask-admin/file/form.html'
    rename_template = 'flask-admin/file/form.html'
    edit_template = 'flask-admin/file/form.html'

    upload_modal_template = 'flask-admin/file/modals/form.html'
    mkdir_modal_template = 'flask-admin/file/modals/form.html'
    rename_modal_template = 'flask-admin/file/modals/form.html'
    edit_modal_template = 'flask-admin/file/modals/form.html'


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


class AuthenticatedView(AdminLTEModelView):
    def is_accessible(self):
        return current_user.is_authenticated

admin.add_view(AuthenticatedView(User, db.session, name="Người Dùng"))
admin.add_view(AuthenticatedView(SanBay, db.session, name="Sân Bay"))
admin.add_view(AuthenticatedView(ChuyenBay, db.session, name="Chuyến Bay"))
admin.add_view(AuthenticatedView(MayBay, db.session, name="Máy Bay"))
admin.add_view(AuthenticatedView(KhachHang, db.session, name='Khách Hàng'))
admin.add_view(AuthenticatedView(Ghe, db.session, name="Ghế Máy Bay"))
admin.add_view(AuthenticatedView(Ve, db.session, name="Vé Máy Bay"))
admin.add_view(AuthenticatedView(TuyenBay, db.session, name="Tuyến Bay"))
admin.add_view(AuthenticatedView(TinhThanh,db.session,name="Tỉnh Thành"))
# admin.add_view(ModelView(TuyenBay, db.session, name='Tuyến Bay'))
# # admin.add_view(ModelView(ChuyenBay, db.session, name='Chuyến Bay'))

admin.add_view(ContactView(name='Liên hệ'))
admin.add_view(LogoutView(name="Đăng xuất"))
