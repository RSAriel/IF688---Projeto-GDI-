import os
import json
from pymongo import MongoClient
from dotenv import load_dotenv
from urllib.parse import quote_plus

# Carregar variáveis do .env
load_dotenv()

usuario = os.getenv("MONGO_USER")
senha = os.getenv("MONGO_PASSWORD")
cluster = os.getenv("MONGO_CLUSTER")
db_name = os.getenv("MONGO_DATABASE")

# Montar URI segura
uri = f"mongodb+srv://{quote_plus(usuario)}:{quote_plus(senha)}@{cluster}/?retryWrites=true&w=majority"
client = MongoClient(uri)
db = client[db_name]

pasta_json = "dados"

for arquivo in os.listdir(pasta_json):
    if arquivo.endswith(".json"):
        caminho_completo = os.path.join(pasta_json, arquivo)
        nome_colecao = os.path.splitext(arquivo)[0]

        with open(caminho_completo, encoding="utf-8") as f:
            dados = json.load(f)
            db[nome_colecao].delete_many({})
            if isinstance(dados, list):
                db[nome_colecao].insert_many(dados)
            else:
                db[nome_colecao].insert_one(dados)
