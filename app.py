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
    return json.dumps({"users": [u.serialize() for u in User.query.all()]}), 200


@app.route("/api/user/<int:id>/")
def get_user(id):
    user = User.query.filter_by(id=id).first()
    if user is None:
        return json.dumps({"error": "User not found."}), 404

    return json.dumps(user.serialize()), 200


@app.route("/api/user/", methods=["POST"])
def create_user():
    body = json.loads(request.data)
    name = body.get("name")
    password = body.get("password")
    if name is None or password is None:
        return json.dumps({"error": "Missing field in body."}), 400

    user = User.query.filter_by(name=name).first()
    if user is not None:
        return json.dumps({"error": "User already exists."}), 400

    new_user = User(name=name, password=password)
    db.session.add(new_user)
    db.session.commit()

    return json.dumps(new_user.serailize), 201


@app.route("/api/user/<int:id>/", methods=["POST"])
def update_user(id):
    user = User.query.filter_by(id=id).first()
    if user is None:
        return json.dumps({"error": "User not found."}), 404

    body = json.loads(request.data)
    name = body.get("name")
    password = body.get("password")
    if name is not None:
        user.name = name
    if password is not None:
        user.password = password

    db.session.commit()
    return json.dumps(user.serialize())


@app.route("/api/user/<int:id>/", methods=["DELETE"])
def delete_user(id):
    user = User.query.filter_by(id=id).first()
    if user is None:
        return json.dumps({"error": "User not found."}), 404

    db.session.delete(user)
    db.session.commit()
    return json.dumps(user.serialize()), 200


@app.route("/api/users/login/")
def login():
    body = json.loads(request.data)
    name = body.get("name")
    password = body.get("password")

    if name is None or password is None:
        return json.dumps({"error": "Missing field in body."}), 400

    user = User.query.filter_by(name=name).first()
    if user is None or user.password is not password:
        return json.dumps({"login": False}), 200

    return json.dumps({"login": True, "id": user.id}), 200


@app.route("/api/events/")
def get_all_events():
    return json.dumps({"events": [e.serialize() for e in Event.query.all()]}), 200


@app.route("/api/event/<int:id>/")
def get_event(id):
    event = Event.query.filter_by(id=id).first()
    if event is None:
        return json.dumps({"error": "Event not found."}), 404

    return json.dumps(event.serialize()), 200


@app.route("/api/user/<int:id>/events/")
def get_user_events(id):
    user = User.query.filter_by(id=id).first()
    if user is None:
        return json.dumps({"error": "User not found."}), 404

    events = [e.serialize for e in user.events]
    for e in events:
        del e["user"]

    return json.dumps(events)


@app.route("/api/user/<int:id>/event/", methods=["POST"])
def create_event(id):
    body = json.loads(request.data)
    title = body.get("title")
    if title is None:
        return json.dumps({"error": "Missing field in body."}), 400

    new_event = Event(title=title, user=id)
    db.session.add(new_event)
    db.session.commit()

    return json.dumps(new_event.serailize), 201


@app.route("/api/event/<int:id>/", methods=["POST"])
def update_event(id):
    event = Event.query.filter_by(id=id).first()
    if event is None:
        return json.dumps({"error": "Event not found."}), 404

    body = json.loads(request.data)
    title = body.get("title")
    if title is not None:
        event.title = title

    db.session.commit()
    return json.dumps(event.serialize())


@app.route("/api/event/<int:id>/", methods=["DELETE"])
def delete_event(id):
    event = Event.query.filter_by(id=id).first()
    if event is None:
        return json.dumps({"error": "Event not found."}), 404

    db.session.delete(event)
    db.session.commit()
    return json.dumps(event.serialize())


if __name__ is "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
