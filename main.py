from flask import Flask, request, send_file, jsonify
from flask_cors import CORS

app = Flask(__name__)
app.config['SECRET_KEY'] = 'vnkdjnfjknfjhgjhjhjfhgjfl1232#'
CORS(app)
app.app_context().push()

@app.route("/", methods=["GET"])
def say_hello():
    return jsonify({"api": "online"})


 
if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, debug=True,use_reloader=False)