import os
from flask import Flask
from flask import jsonify
from flask_cors import CORS

# Set up the backend server
app = Flask(__name__)
app.config.from_mapping(
    DEBUG=False,
    WEB_ADDRESS="0.0.0.0",
    WEB_PORT=8080,
)

# Enable CORS
CORS(app, resources={r"/drone/*": {"origins": "*"}})

# The logging has already been set up
app.logger.info("Server started.")

@app.route("/test/backend", methods=["POST"])
def test():
    try:
        app.logger.info(f"Backend is up and running.")
        return jsonify({"status": "success", "response": "We are good to go."}), 200
    except Exception as e:
        app.logger.error(f"Error during start up.")
        return jsonify({"status": "error", "message": "God damn flask."}), 500


if __name__ == "__main__":
    try:
        app.run(debug = False, host="0.0.0.0", port=8080)
    except Exception as e:
        app.logger.error(f"An error occurred: {str(e)}")
