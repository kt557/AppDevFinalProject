from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# your classes here

users_to_events = db.Table("users_to_events", db.Model.metadata,
                           db.Column("user_id", db.Integer,
                                     db.ForeignKey("users.id")),
                           db.Column("event_id", db.Integer,
                                     db.ForeignKey("events.id"))
                           )


class User (db.Model):
    """
    User model
    """
    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String, nullable=False)
    password = db.Column(db.String, nullable=False)

    attending = db.relationship(
        "Event", secondary=users_to_events, back_populates='attendees')

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

    attendees = db.relationship(
        "User", secondary=users_to_events, back_populates='attending')

    def __init__(self, **kwargs):
        """
        Initialize event object
        """
        self.title = kwargs.get("title")

    def serialize(self):
        """
        Serialize a event object
        """
        return {
            "id": self.id,
            "title": self.title,
            "users": [a.serialize() for a in self.attendees]
        }
