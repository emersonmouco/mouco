# arquivo de configuração para conexão com o banco de dados
import mysql.connector 
from mysql.connector import Error 

# neste projeto iremos utilizar o MySQL
# arquivo de configuração
# para conexão com o banco de dados


# Configurações das credenciais do MySQL 
DB_CONFIG = {
	'host': 'localhost', # local que ta instalado o banco de dados
	'user' : 'root', # usuario principal do banco de dados, pode ser root
	'password': 'VoucherDev@2024', # senha do usuario principal
	'database' : 'projeto_loja' # nome do banco, no banco de dados
}

def conectar_mysql():
	try:
		conn = mysql.connector.connect(
			host = DB_CONFIG['host'],
			user = DB_CONFIG['user'],
			password = DB_CONFIG['password'],
			autocommit = True # se nao colocar isso irá dar o erro de Transaction Already Exists
		)
		cursor = conn.cursor()
		cursor.execute(f"CREATE DATABASE IF NOT EXISTS {DB_CONFIG['database']}")
		conn.database = DB_CONFIG['database']
		print("Conexão com o MySQL bem-sucedida!")
		return conn
	except Error as e:
		print(f"Erro ao conectar com o MySQL: {e}")
		return None

def criar_tabelas(conn):
	if not conn:
		return
	
	cursor = conn.cursor()
	try:
		cursor.execute("""
        CREATE TABLE IF NOT EXISTS pessoa(
            id_pessoa INT AUTO_INCREMENT PRIMARY KEY,
            nome_pessoa VARCHAR(255) NOT NULL,
            endereco_pessoa VARCHAR(255)
        )""")

		cursor.execute("""
        CREATE TABLE IF NOT EXISTS cliente(
            id_cliente INT AUTO_INCREMENT PRIMARY KEY,
            cpf_cliente VARCHAR(40) NOT NULL UNIQUE,
            email_cliente VARCHAR(100),
            senha_cliente VARCHAR(100),
            nivel_cliente INT DEFAULT 1,
            id_pessoa INT NOT NULL,
            FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa) ON DELETE CASCADE
        )""")

		cursor.execute("""
        CREATE TABLE IF NOT EXISTS funcionario(
            id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
            salario_funcionario DECIMAL(10,2),
            cargo_funcionario VARCHAR(100),
            id_pessoa INT NOT NULL,
            FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa) ON DELETE CASCADE
        )""")

		cursor.execute("""
        CREATE TABLE IF NOT EXISTS marca(
            id_marca INT AUTO_INCREMENT PRIMARY KEY,
            nome_marca VARCHAR(100) NOT NULL,
            descricao_marca VARCHAR(100)
        )""")

		cursor.execute("""
        CREATE TABLE IF NOT EXISTS produto(
            id_produto INT AUTO_INCREMENT PRIMARY KEY,
            nome_produto VARCHAR(100) NOT NULL,
            preco_produto DECIMAL(10,2) NOT NULL,
            descricao_produto VARCHAR(100),
            id_marca INT NOT NULL,
            FOREIGN KEY (id_marca) REFERENCES marca(id_marca) ON DELETE CASCADE
        )""")

		print("Tabelas verificadas/criadas com sucesso!")

	except Error as e:
		print(f"Erro ao criar as tabelas: {e}")
		raise e
	finally:
		cursor.close()

# --- CRUD de MARCA ---
def cadastrar_marca(conn, nomeMarca, descricaoMarca):
	cursor = conn.cursor()
	try:
		sql = "INSERT INTO marca (nome_marca, descricao_marca) VALUES (%s, %s)"
		cursor.execute(sql, (nomeMarca, descricaoMarca))
		conn.commit()
	finally:
		cursor.close()

def listar_marcas(conn):
	cursor = conn.cursor(dictionary = True)
	try:
		cursor.execute("SELECT * FROM marca ORDER BY nome_marca")
		return cursor.fetchall()
	finally:
		cursor.close() 

def alterar_marca(conn, id_marca, nome, descricao):
	cursor = conn.cursor()
	try:
		sql = "UPDATE marca SET nome_marca = %s, descricao_marca = %s WHERE id_marca = %s"
		cursor.execute(sql, (nome, descricao, id_marca))
		conn.commit()
	finally:
		cursor.close()

def excluir_marca(conn, id_marca):
	cursor = conn.cursor()
	try:
		cursor.execute("DELETE FROM marca WHERE id_marca = %s", (id_marca,))
		conn.commit()
	except mysql.connector.Error as e:
		if e.errno == 1451:
			raise ValueError("Não é possível excluir esta marca, pois ela está associada a um ou mais produtos!")
		else:
			raise

# --- CRUD de CLIENTE 
def cadastrar_cliente(conn, nome, endereco, cpf, email, senha, nivel):
	cursor = conn.cursor()
	try:
		conn.start_transaction()
		sql_pessoa = "INSERT INTO pessoa (nome_pessoa, endereco_pessoa) VALUES (%s, %s)"
		cursor.execute(sql_pessoa, (nome, endereco))

		id_pessoa = cursor.lastrowid
		sql_cliente = "INSERT INTO cliente (cpf_cliente, email_cliente, senha_cliente, nivel_cliente, id_pessoa) VALUES (%s, %s, %s, %s, %s)"
		cursor.execute(sql_cliente, (cpf, email, senha, nivel, id_pessoa))

		conn.commit()
	except Exception as e:
		conn.rollback()
		print(f"Erro ao cadastrar cliente: {e}")
		raise e
	finally:
		cursor.close()

def listar_clientes(conn):
    cursor = conn.cursor(dictionary=True)
    try:
        sql = """
            SELECT 
                p.id_pessoa, 
                p.nome_pessoa, 
                p.endereco_pessoa,
                c.id_cliente, 
                c.cpf_cliente, 
                c.email_cliente,
				c.senha_cliente,
                c.nivel_cliente
            FROM pessoa p
            JOIN cliente c ON p.id_pessoa = c.id_pessoa
            ORDER BY p.nome_pessoa
        """
        cursor.execute(sql)
        return cursor.fetchall()
    finally:
        cursor.close()

def alterar_cliente(conn, id_pessoa, nome, endereco, cpf, email, senha, nivel):
    cursor = conn.cursor()
    try:
        conn.start_transaction()
        
        sql_pessoa = "UPDATE pessoa SET nome_pessoa = %s, endereco_pessoa = %s WHERE id_pessoa = %s"
        cursor.execute(sql_pessoa, (nome, endereco, id_pessoa))

        sql_cliente = "UPDATE cliente SET cpf_cliente = %s, email_cliente = %s, senha_cliente = %s, nivel_cliente = %s WHERE id_pessoa = %s"
        cursor.execute(sql_cliente, (cpf, email, senha, nivel, id_pessoa))

        conn.commit()
    except Exception as e:
        conn.rollback()
        raise e
    finally:
        cursor.close()

def excluir_cliente(conn, id_pessoa):
    cursor = conn.cursor()
    try:
        sql = "DELETE FROM pessoa WHERE id_pessoa = %s"
        cursor.execute(sql, (id_pessoa,))
        conn.commit()
    except Exception as e:
        raise e
    finally:
        cursor.close()

# ---- CRUD DO FUNCIONARIO ----
def cadastrar_funcionario(conn, nome, endereco, cargo, salario):
	cursor = conn.cursor()
	try:
		conn.start_transaction()
		sql_pessoa = "INSERT INTO pessoa (nome_pessoa, endereco_pessoa) VALUES (%s, %s)"
		cursor.execute(sql_pessoa, (nome, endereco))

		id_pessoa = cursor.lastrowid
		sql_funcionario = "INSERT INTO funcionario (salario_funcionario, cargo_funcionario, id_pessoa) VALUES (%s, %s, %s)"
		cursor.execute(sql_funcionario, (salario, cargo, id_pessoa))

		conn.commit()
	except Exception as e:
		conn.rollback()
		print(f"Erro ao cadastrar funcionario: {e}")
		raise e
	finally:
		cursor.close()

def listar_funcionarios(conn):
    cursor = conn.cursor(dictionary=True)
    try:
        sql = """
            SELECT 
                p.id_pessoa, 
                p.nome_pessoa, 
                p.endereco_pessoa,
                f.id_funcionario, 
                f.salario_funcionario, 
                f.cargo_funcionario
            FROM pessoa p
            JOIN funcionario f ON p.id_pessoa = f.id_pessoa
            ORDER BY p.nome_pessoa
        """
        cursor.execute(sql)
        return cursor.fetchall()
    finally:
        cursor.close()

def alterar_funcionario(conn, id_pessoa, nome, endereco, salario, cargo):
    cursor = conn.cursor()
    try:
        conn.start_transaction()
        
        sql_pessoa = "UPDATE pessoa SET nome_pessoa = %s, endereco_pessoa = %s WHERE id_pessoa = %s"
        cursor.execute(sql_pessoa, (nome, endereco, id_pessoa))

        sql_funcionario = "UPDATE funcionario SET salario_funcionario = %s, cargo_funcionario = %s WHERE id_pessoa = %s"
        cursor.execute(sql_funcionario, (salario, cargo, id_pessoa))

        conn.commit()
    except Exception as e:
        conn.rollback()
        raise e
    finally:
        cursor.close()

def excluir_funcionario(conn, id_pessoa):
    cursor = conn.cursor()
    try:
        sql = "DELETE FROM pessoa WHERE id_pessoa = %s"
        cursor.execute(sql, (id_pessoa,))
        conn.commit()
    except Exception as e:
        raise e
    finally:
        cursor.close()


# ---- CRUD DO PRODUTO ----
def cadastrar_produto(conn, nome, preco, descricao, id_marca):
	cursor = conn.cursor()
	try:
		sql = """
				INSERT INTO produto
				(nome_produto, preco_produto, descricao_produto, id_marca)
				VALUES
				(%s, %s, %s, %s)
		"""
		cursor.execute(sql, (nome, preco, descricao, id_marca))
		conn.commit()
	except Error as e:
		print(f"Erro ao cadastrar produto. Erro: {e}")
		raise e
	finally:
		cursor.close()

def listar_produtos(conn):
	# por que dictionary = True?
	# Como iremos trazer vários atributos bem como seus respectivos dados armazenados
	# isso sera organizado na forma de um dicionario para facilitar na visualização do window
	# ex: {'id_produto':1, 'nome_produto': coca cola, 'descricao_produto': refri }
	# ex  {'id_produto':2, 'nome_produto': arroz, 'descricao_produto': cereal }
	cursor = conn.cursor(dictionary=True)
	try:
		sql = """
			SELECT
				p.id_produto,
				p.nome_produto,
				p.preco_produto,
				p.descricao_produto,
				m.nome_marca
			FROM
				produto p
			JOIN
				marca m ON p.id_marca = m.id_marca
			ORDER BY
				p.nome_produto
		"""
	except Error as e:
		print(f"Erro ao listar produtos. Erro: {e}")
		raise e
	finally:
		cursor.close()

def alterar_produto(conn, id_produto, nome, preco, descricao, id_marca):
	cursor = conn.cursor()

	try:
		sql = """
			UPDATE produto SET
				nome_produto = %s,
				preco_produto = %s,
				descricao_produto = %s,
				id_marca = %s
			WHERE
				id_produto = %s
		"""
		cursor.execute(sql, (nome, preco, descricao, id_marca, id_produto))
		conn.commit()
	except Error as e:
		print(f"Erro ao alterar produto. Erro: {e}")
		raise e
	finally:
		cursor.close()

def excluir_produto(conn, id_produto):
	cursor = conn.cursor()

	try:
		sql = "DELETE FROM produto WHERE id_produto = %s"
		cursor.execute(sql, (id_produto))
		conn.commit()
	except Error as e:
		print(f"Erro ao excluir produto. Erro: {e}")
		raise e
	finally:
		cursor.close()