from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/health')
def health():
    # Kubernetes calls this to check if pod is alive
    return jsonify({'status': 'ok'}), 200

@app.route('/')
def index():
    return jsonify({'message': 'CI/CD Demo App', 'version': '1.0.0'}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
