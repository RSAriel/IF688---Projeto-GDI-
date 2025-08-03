from pymongo import MongoClient
from dotenv import load_dotenv
from urllib.parse import quote_plus
import os

load_dotenv()

usuario = os.getenv("MONGO_USER")
senha = os.getenv("MONGO_PASSWORD")
cluster = os.getenv("MONGO_CLUSTER")
db_name = os.getenv("MONGO_DATABASE")

uri = f"mongodb+srv://{quote_plus(usuario)}:{quote_plus(senha)}@{cluster}/?retryWrites=true&w=majority"
client = MongoClient(uri)
db = client[db_name]

while True:
    print("\n1 - Referência Simples (1:1)")
    print("2 - Documento Embutido (1:1 embed)")
    print("3 - Array de Referência (1:N)")
    print("4 - Array de Documentos Embutidos (1:N embed)")
    print("0 - Encerrar o programa")
    option = int(input("Escolha uma opção: "))

    if option == 0:
        break

    elif option == 1:
        estudantes = db["estudante_ref"]
        casas = db["casa_ref_array"]

        casa = casas.find_one({"Nome": "Grifinória"})
        resultado = estudantes.find({"id_casa": casa["ID"]})

        for r in resultado:
            print(r["cpf"])

    elif option == 2:
        colecao = db["estudante_embed"]
        resultado = colecao.find({"casa.Nome": "Corvinal"})

        for r in resultado:
            print(r["nome"])

    elif option == 3:
        casas = db["casa_ref_array"]
        estudantes = db["estudante_ref"]

        casa = casas.find_one({"Nome": "Lufa-Lufa"})
        resultado = estudantes.find({"cpf": {"$in": casa["estudantes"]}})

        for r in resultado:
            print(r["nome"])

    elif option == 4:
        casas = db["casa_embed_array"]
        casa = casas.find_one({"Nome": "Sonserina"})

        for estudante in casa["estudantes"]:
            print(estudante["nome"])

    else:
        print("Escolha uma opção válida")