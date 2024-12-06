from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# your classes here


class User (db.Model):
    """
    User model
    """
    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String, nullable=False)
    password = db.Column(db.String, nullable=False)

    events = db.relationship("Event", cascade="delete")

    def __init__(self, **kwargs):
        """
        Initialize user object
        """
        self.name = kwargs.get("name")
        self.password = kwargs.get("password")

    def serialize(self):
        """
        Serialize a user object
        """
        return {
            "id": self.id,
            "name": self.name
        }


class Event (db.Model):
    """
    Event Model
    """
    __tablename__ = "events"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String, nullable=False)
    user = db.Column(db.Integer, db.ForeignKey("users.id"), nullable=False)

    def __init__(self, **kwargs):
        """
        Initialize event object
        """
        self.title = kwargs.get("title")
        self.user = kwargs.get("user")

    def serialize(self):
        """
        Serialize a event object
        """
        return {
            "id": self.id,
            "title": self.title,
            "user": User.query.filter_by(id=self.user).first().serialize()
        }
