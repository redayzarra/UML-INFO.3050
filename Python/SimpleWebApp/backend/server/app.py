import os
from flask import Flask
from flask import jsonify
from flask_cors import CORS
from datetime import datetime
import pytz

# Set up the backend server
app = Flask(__name__)
app.config.from_mapping(
    DEBUG=False,
    WEB_ADDRESS="0.0.0.0",
    WEB_PORT=8080,
)

# Enable CORS
CORS(app, resources={r"/*": {"origins": "*"}})

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

@app.route("/assignment", methods=["GET"])
def assignment():
    try:
        # Specify the timezone
        timezone = pytz.timezone("America/New_York") 

        # Get current time in the specified timezone
        current_time = datetime.now(timezone)

        # Format the time
        formatted_time = current_time.strftime("%I:%M %p")

        response = {"timezone": str(timezone), "current_time": formatted_time}

        app.logger.info(f"Successfully got the assignment values.")
        return jsonify({"status": "success", "response": response}), 200
    except Exception as e:
        app.logger.error(f"There was an error trying to get the assignment values: {e}")
        return jsonify({"status": "error", "message": str(e)}), 500

if __name__ == "__main__":
    try:
        app.run(debug = False, host="0.0.0.0", port=8080)
    except Exception as e:
        app.logger.error(f"An error occurred: {str(e)}")
