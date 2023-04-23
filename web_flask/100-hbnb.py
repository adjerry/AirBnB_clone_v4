#!/usr/bin/python3
"""
A script that starts a Flask web application:
"""

from flask import Flask
from models import storage
from flask import render_template

app = Flask(__name__)


@app.route('/hbnb', strict_slashes=False)
def states_list_route():
    """
    List all cities a of states: display a HTML page: (inside the tag BODY)
    Returns:
    html: template that lists states, cities & amenity sort by name A->Z
    """
    data = {
            "states": storage.all("State").values(),
            "places": storage.all("Place").values(),
            "amenities": storage.all("Amenity").values()
            }
    return render_template("100-hbnb.html", models=data)


@app.teardown_appcontext
def close_db(exception=None):
    """
    After each request remove the current SQLAlchemy Session
    """
    storage.close()


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
