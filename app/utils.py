from app.models import User
from app import db

def get_user_by_id(user_id):
    return User.query.get(user_id)