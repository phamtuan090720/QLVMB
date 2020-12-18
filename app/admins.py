from flask import redirect, request
from app import admin, db, utils
from flask_admin.contrib.sqla import ModelView
from flask_admin.contrib.fileadmin import FileAdmin
from app.models import *
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

class SearchFlight(BaseView):
    @expose('/',methods=['POST','GET'])

    def index(self):
        tinhThanh = utils.get_tinhThanh()
        if request.args.get('date'):
            date = datetime.strptime(request.args.get('date'),"%Y-%m-%dT%H:%M")
            flight = utils.read_data_fight(place_start=request.args.get('From'),place_end=request.args.get('To'),date=date)
        else:
            flight = utils.read_data_fight(place_start=request.args.get('From'), place_end=request.args.get('To'))
        return self.render('admin/flight-list.html',tinhThanh=tinhThanh,flight=flight,utils=utils)
    def is_accessible(self):
        return current_user.is_authenticated
class FlightCreation(BaseView):
    @expose('/', methods=['POST', 'GET'])
    def index(self):
        return self.render('admin/flight-creation.html')

    def is_accessible(self):
        return current_user.is_authenticated
class IssueTheTiket(BaseView):
    @expose('/',methods=['POST','GET'])
    def index(self):
        flight = utils.get_all_ChuyenBay()
        list_ticket = utils.find_ticket(cmnd=request.args.get("cmnd"),id_chuyenBay=request.args.get("idChuyenBay"))
        return self.render('admin/issue-the-ticket.html',list_ticket=list_ticket,utils=utils,flight=flight)
    def is_accessible(self):
        return current_user.is_authenticated

class BookTicket(BaseView):
    @expose('/')
    def index(self):
        tinhThanh = utils.get_tinhThanh()
        return self.render('admin/book-ticket.html',tinhThanh=tinhThanh)
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
admin.add_view(AuthenticatedView(SanBayChungChuyen,db.session,name="Sân Bay Chung Chuyển"))
admin.add_view(SearchFlight(name="Tra Cứu Chuyến Bay"))
admin.add_view(FlightCreation(name='Tạo Chuyến Bay'))
admin.add_view(IssueTheTiket(name="Xuất Vé"))
admin.add_view(BookTicket(name='Đặt Vé'))
admin.add_view(ContactView(name='Liên hệ'))
admin.add_view(LogoutView(name="Đăng xuất"))


