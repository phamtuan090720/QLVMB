from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin, AdminIndexView, expose
from flask_login import LoginManager
from flask_adminlte3 import AdminLTE3

app = Flask(__name__)
app.secret_key="\x85\xef\x1a\x8b8\xae\xaab\xf5\x18PT)\xa7(\x0b"
app.config["SQLALCHEMY_DATABASE_URI"] ="mysql+pymysql://root:123456789@localhost/qlbanvemaybay?charset=utf8mb4"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True
class MyAdminIndexView(AdminIndexView):
    @expose('/', methods=['GET', 'POST'])
    def index(self):
        return self.render('admin/my_index.html')


db = SQLAlchemy(app=app)
admin = Admin(app=app, name="QL VÉ MÁY BAY", base_template='admin/my_master.html', template_mode='bootstrap4',
              index_view=MyAdminIndexView())
login = LoginManager(app=app)
AdminLTE3(app=app)



