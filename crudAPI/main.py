from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from prometheus_client import Counter, Histogram, make_wsgi_app
from werkzeug.middleware.dispatcher import DispatcherMiddleware
import logging
import os
from datetime import datetime
import time
from threading import Thread

# Flask App Initialization
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///crudapi.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# Prometheus Metrics
REQUEST_COUNT = Counter(
    'flask_api_requests_total', 'Total API Requests',
    ['method', 'endpoint', 'http_status']
)
REQUEST_LATENCY = Histogram(
    'flask_api_request_duration_seconds', 'Request Latency',
    ['method', 'endpoint']
)
ERROR_COUNT = Counter(
    'flask_api_errors_total', 'API Errors Count',
    ['method', 'endpoint', 'error_type']
)

# Add Prometheus WSGI middleware to expose metrics at /metrics
app.wsgi_app = DispatcherMiddleware(app.wsgi_app, {'/metrics': make_wsgi_app()})

# Logging Setup
if not os.path.exists('logs'):
    os.mkdir('logs')
logging.basicConfig(
    filename='logs/app.log',
    level=logging.DEBUG,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

# Database Model
class Item(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.String(200), nullable=False)

    def __repr__(self):
        return f"Item('{self.name}', '{self.description}')"

# Log Rotation Function
def rotate_logs():
    while True:
        time.sleep(86400)  # Rotate logs every 24 hours
        log_filename = 'logs/app.log'
        if os.path.exists(log_filename):
            new_log_filename = f'logs/app_{datetime.now().strftime("%Y%m%d")}.log'
            os.rename(log_filename, new_log_filename)
            logging.info(f"Log file rotated to {new_log_filename}")

# Metrics Middleware
@app.before_request
def before_request():
    request.start_time = time.time()

@app.after_request
def after_request(response):
    request_latency = time.time() - request.start_time
    REQUEST_COUNT.labels(request.method, request.path, response.status_code).inc()
    REQUEST_LATENCY.labels(request.method, request.path).observe(request_latency)
    return response

@app.errorhandler(Exception)
def handle_exception(e):
    logging.error(f"Error: {e}")
    ERROR_COUNT.labels(request.method, request.path, type(e).__name__).inc()
    return jsonify({'error': 'An internal error occurred', 'message': str(e)}), 500

# Health Check
@app.route('/health', methods=['GET'])
def health_check():
    return jsonify({"status": "healthy"}), 200

# CRUD Operations
@app.route('/items', methods=['GET'])
def get_items():
    try:
        items = Item.query.all()
        logging.info(f"Fetched {len(items)} items")
        return jsonify([{'id': item.id, 'name': item.name, 'description': item.description} for item in items])
    except Exception as e:
        return handle_exception(e)

@app.route('/items', methods=['POST'])
def add_item():
    try:
        data = request.get_json()
        new_item = Item(name=data['name'], description=data['description'])
        db.session.add(new_item)
        db.session.commit()
        logging.info(f"Added new item: {data['name']}")
        return jsonify({'message': 'Item added successfully'}), 201
    except KeyError:
        return jsonify({'error': 'Invalid data', 'message': 'Missing name or description'}), 400
    except Exception as e:
        return handle_exception(e)

@app.route('/items/<int:id>', methods=['PUT'])
def update_item(id):
    try:
        item = Item.query.get_or_404(id)
        data = request.get_json()
        item.name = data['name']
        item.description = data['description']
        db.session.commit()
        logging.info(f"Updated item ID {id}")
        return jsonify({'message': 'Item updated successfully'})
    except Exception as e:
        return handle_exception(e)

@app.route('/items/<int:id>', methods=['DELETE'])
def delete_item(id):
    try:
        item = Item.query.get_or_404(id)
        db.session.delete(item)
        db.session.commit()
        logging.info(f"Deleted item ID {id}")
        return jsonify({'message': 'Item deleted successfully'})
    except Exception as e:
        return handle_exception(e)

@app.route('/error/<error_code>', methods=['GET'])
def trigger_error(error_code):
    error_map = {
        '400': (400, "Bad Request Error"),
        '401': (401, "Unauthorized Access"),
        '403': (403, "Forbidden Access"),
        '404': (404, "Resource Not Found"),
        '500': (500, "Internal Server Error"),
        '503': (503, "Service Unavailable")
    }
    code, message = error_map.get(error_code, (400, "Unknown Error"))
    logging.error(f"Generated Error {code}: {message}")
    return jsonify({'error': message}), code

# Initialize Database
def initialize_db():
    with app.app_context():
        db.create_all()
        logging.info("Database initialized")

# Main Function
if __name__ == '__main__':
    initialize_db()
    log_rotation_thread = Thread(target=rotate_logs)
    log_rotation_thread.daemon = True
    log_rotation_thread.start()
    app.run(debug=True, host='0.0.0.0', port=5000)
