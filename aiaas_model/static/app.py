# app.py
from flask import Flask, render_template, request
from cryptography.hazmat.primitives.serialization import load_pem_private_key
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
import os

app = Flask(__name__)
UPLOAD_FOLDER = 'uploads'
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

# Load private key once
with open("keys/private_key.pem", "rb") as f:
    PRIVATE_KEY = load_pem_private_key(f.read(), password=None, backend=default_backend())

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/upload', methods=['POST'])
def upload():
    encrypted_key = request.files['encrypted_key'].read()
    iv = request.files['iv'].read()
    encrypted_image = request.files['encrypted_image'].read()
    encrypted_data = request.files['encrypted_data'].read()

    # Decrypt AES key
    aes_key = PRIVATE_KEY.decrypt(
        encrypted_key,
        padding.OAEP(
            mgf=padding.MGF1(algorithm=hashes.SHA256()),
            algorithm=hashes.SHA256(),
            label=None
        )
    )

    # Decrypt face image
    cipher = Cipher(algorithms.AES(aes_key), modes.CFB(iv), backend=default_backend())
    decryptor = cipher.decryptor()
    decrypted_image = decryptor.update(encrypted_image) + decryptor.finalize()

    with open(os.path.join(UPLOAD_FOLDER, "decrypted_face.jpg"), "wb") as f:
        f.write(decrypted_image)

    # Decrypt criminal data (text)
    cipher = Cipher(algorithms.AES(aes_key), modes.CFB(iv), backend=default_backend())
    decryptor = cipher.decryptor()
    decrypted_data = decryptor.update(encrypted_data) + decryptor.finalize()
    criminal_info = decrypted_data.decode()

    return f"<h3>Upload complete!</h3><p>Criminal data: {criminal_info}</p><img src='/uploads/decrypted_face.jpg' width='200'>"

@app.route('/uploads/<filename>')
def uploaded_file(filename):
    from flask import send_from_directory
    return send_from_directory(UPLOAD_FOLDER, filename)

if __name__ == '__main__':
    app.run(debug=True)
