import os
from flask import Flask
app = Flask(__name__)

@app.route("/")
def main():
    return "<h1> Python Flask App </h1>"

@app.route("/v1")
def hello():
    return "<h1> This is response from V1 </h1>"

if __name__ = "__main__":
    app.run(host="0.0.0.0", port=8000)
