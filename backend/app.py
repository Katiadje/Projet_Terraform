from flask import Flask, jsonify
import psycopg2
import os

app = Flask(__name__)

# Récupérer les informations de la configuration
POSTGRESQL_CONNECTION_STRING = os.environ.get("POSTGRESQL_CONNECTION_STRING")
AZURE_STORAGE_ACCOUNT_NAME = os.environ.get("AZURE_STORAGE_ACCOUNT_NAME")
AZURE_STORAGE_ACCOUNT_KEY = os.environ.get("AZURE_STORAGE_ACCOUNT_KEY")
VM_PUBLIC_IP = os.environ.get("VM_PUBLIC_IP")

@app.route('/')
def home():
    return jsonify({"message": "Bienvenue dans l'application Flask!"})

@app.route('/postgresql')
def postgresql_info():
    try:
        # Connexion à la base de données PostgreSQL
        conn = psycopg2.connect(POSTGRESQL_CONNECTION_STRING)
        cur = conn.cursor()

        # Exemple simple pour récupérer les bases de données
        cur.execute("SELECT datname FROM pg_database;")
        dbs = cur.fetchall()

        cur.close()
        conn.close()

        return jsonify({"databases": dbs})

    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/storage')
def storage_info():
    # Cette fonction pourrait appeler Azure SDK pour obtenir des informations sur le stockage
    # Pour l'exemple, on renvoie des informations fictives
    return jsonify({
        "storage_account_name": AZURE_STORAGE_ACCOUNT_NAME,
        "storage_account_key": AZURE_STORAGE_ACCOUNT_KEY,
        "storage_container_name": "katia-container"
    })

@app.route('/vm')
def vm_info():
    return jsonify({
        "vm_name": "VMkatia",
        "public_ip": VM_PUBLIC_IP,
        "private_ip": "10.0.1.4"  # Vous pouvez remplacer par l'IP privée obtenue via la VM
    })

if __name__ == '__main__':
    # Configuration des variables d'environnement
    app.config['POSTGRESQL_CONNECTION_STRING'] = os.environ.get('POSTGRESQL_CONNECTION_STRING')
    app.config['AZURE_STORAGE_ACCOUNT_NAME'] = os.environ.get('AZURE_STORAGE_ACCOUNT_NAME')
    app.config['AZURE_STORAGE_ACCOUNT_KEY'] = os.environ.get('AZURE_STORAGE_ACCOUNT_KEY')
    app.config['VM_PUBLIC_IP'] = os.environ.get('VM_PUBLIC_IP')

    app.run(host='0.0.0.0', port=5000)
