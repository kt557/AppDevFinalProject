import json
from flask import Flask, request
from db import db, User, Event

app = Flask(__name__)
db_filename = "cal.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()

# Routes here!
@app.route("/api/users/")
def get_all_users():
    pass

@app.route("/api/user/<int:id>/")
def get_user(id):
    pass

@app.route("/api/user/", methods=["POST"])
def create_user():
    pass

@app.route("/api/user/<int:id>/", methods=["POST"])
def update_user(id):
    pass

@app.route("/api/user/<int:id>/", methods=["DELETE"])
def delete_user(id):
    pass

@app.route("/api/event/<int:id>/")
def get_event(id):
    pass

@app.route("/api/user/<int:id>/events/<string:date>/")
def get_user_events_on_date(id, date):
    pass

@app.route("/api/event/", methods=["POST"])
def create_event():
    pass

@app.route("/api/event/<int:id>/", methods=["POST"])
def update_event(id):
    pass

@app.route("/api/event/<int:id>/", methods=["DELETE"])
def delete_event(id):
    pass


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
