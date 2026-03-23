from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/health', methods=['GET'])
def health():
    return jsonify({'status': 'ok'}), 200

@app.route('/', methods=['GET'])
def index():
    return jsonify({'message': 'CI/CD Demo App', 'version': '1.0.0'}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)