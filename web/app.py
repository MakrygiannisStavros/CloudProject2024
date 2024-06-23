from flask import Flask, jsonify

app = Flask(__name__)

# Route for home
@app.route('/')


def home():
    return "Welcome to the Virtual Lab Web Service!"

# Route for fetching data
@app.route('/data', methods=['GET'])
def get_data():
    sample_data = {
        'message': 'This is some sample data',
        'items': [1, 2, 3, 4, 5]
    }
    return jsonify(sample_data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
