# arquivo principal do projeto
# é ele que é executado

from db import database_manager as db
from gui.main_window import MainWindow
import tkinter as tk

def main():
	# função principal que inicializa a aplicação/sistema
	conn = None # inicializa a variável de conexão como None, somente para iniciar ela

	try:
		# tentativa de conexão com o banco
		print("Tentando conectar com o banco de dados...")
		conn = db.conectar_mysql()
		# se não existir conexão, não conseguir conectar 
		# será exibido um erro
		if not conn:
			root = tk.Tk()
			root.withdraw() # esconde a janela principal
			tk.messagebox.showerror("Erro crítico!",
						   "Falha na conexão com o banco de dados, verifique se o MySQL está em execução!",
						   "Aplicação encerrada!"
						   )
			return
		
		# verificando se as tabelas existem, se não, cria elas
		print("Configurando tabela do banco de dados...")
		db.criar_tabelas(conn)

		# inicia a interface gráfica do sistema
		# passando a conexão
		print("Iniciando a interface gráfica...")
		app = MainWindow(conn)
		app.mainloop()
	
	except Exception as e:
		# captura qualquer erro inesperado durante a inicialização
		print(f"Ocorreu um erro inesperado: {e}")
		tk.messagebox.showerror("Erro inesperado!", f"Erro: {e}")

	finally:
		# garante que a conexão com o banco de dados será fechada
		# mesmo que tenha dado erro
		# se a conexão foi aberta, ela será fechada
		if conn and conn.is_connected():
			conn.close()
			print("Conexão com o banco de dados fechada!")

if __name__ == "__main__":
	main()