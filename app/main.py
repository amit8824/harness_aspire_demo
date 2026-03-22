from flask import Flask, jsonify
app = Flask(__name__)

@app.route('/health')
def health():
    # Kubernetes calls this URL every 15 seconds to confirm the pod is alive
    return jsonify({'message': 'CI/CD Demo App', 'version': '1.0.0'}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
