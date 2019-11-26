from flask import Flask, render_template, redirect, jsonify

from flask_pymongo import PyMongo
import pymongo

from bson import json_util


import json



app = Flask(__name__)



# establish a connection to mongodb and create table(collection) variants

print("connection to variants db ....")
mongo = PyMongo(app, uri="mongodb://localhost:27017/variants")

# Declare the database/ select database and collection to use



@app.route("/")
def home_page():

	conn = 'mongodb://localhost:27017'
	client = pymongo.MongoClient(conn)

	db = client.variants

	# Declare the collection
	collection = db.explore
	
	print("rendering annotation for first 20 samples ....")
	db_data = list(collection.find().limit(20))
	
	# return sample variant data in json format
	return json.dumps(db_data, default =json_util.default)
	

@app.route("/mutation")
def home_page():

	conn = 'mongodb://localhost:27017'
	client = pymongo.MongoClient(conn)

	db = client.variants

	# Declare the collection
	collection = db.explore


	#return only type of mutation, gene name, codon and gene symbol
	mutation = list(collection.find({"Consequence": "missense_variant"},
                               {"Gene":1,"Consequence":1,"Codons": 1, "SYMBOL": 1}))
	return json.dumps(mutation, default =json_util.default)


if __name__ == '__main__':
	app.run(debug=True)



