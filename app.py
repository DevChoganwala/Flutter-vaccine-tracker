from logging import debug
from flask import Flask, jsonify, request
import json
from apscheduler.schedulers.background import BackgroundScheduler
import time
from get_data import *

response = ''

app = Flask(__name__)

@app.route('/api', methods = ['GET', 'POST'])
def UserRoute():
    global response
    if(request.method == 'POST'):
        request_data = request.data #getting the response data
        request_data = json.loads(request_data.decode('utf-8')) #converting it from json to key value pair
        mail_data(request_data)
        scheduler = BackgroundScheduler()
        job = scheduler.add_job(mail_data, "interval", [request_data], minutes=1)
        scheduler.start()
        return " "
    
    return " "


if __name__ == "__main__":
    app.run(debug=True)