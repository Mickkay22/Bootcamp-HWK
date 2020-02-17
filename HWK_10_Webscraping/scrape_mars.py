# import necessary libraries
from flask import Flask, render_template
from flask_pymongo import PyMongo
import mission_to_mars
# create instance of Flask app
app = Flask(__name__)

app.config["MONGO_URI"] = 'mongodb://localhost:27017/mars_db'
mongo = PyMongo(app)


# create route that renders index.html template
@app.route("/")
def index():
    mars = mongo.db.mars_info.find_one()
    return render_template("index.html", mars = mars)

@app.route("/scrape")
def scrape_data():
    mars = mongo.db.mars_db
    mars_data = mission_to_mars.mars_scrape()
    mars.update({},mars_data,upsert = True)
    print(mars)
    return "Did it!"

if __name__ == "__main__":
    app.run(debug=True)