import tkinter as tk
from tkinter import messagebox

# importando as classes das telas de cadastros
# usamos o . (ponto) antes do nome do arquivo para que ele possa ter certeza
# que está no mesmo diretório
from .cliente_window import ClienteWindow
from .funcionario_window import FuncionarioWindow
from .marca_window import MarcaWindow
from .produto_window import ProdutoWindow

# janela principal do sistema
class MainWindow(tk.Tk):
	def __init__(self, conn):
		"""
			utilizamos o conn aqui para que conseguimos conectar ao banco
			e ter conexão ativa com a função de conexão com o banco
		
		"""

		super().__init__()
		self.title("Sistema de Loja - Senac") # título da janela
		self.geometry("800x600") # tamanho da janela

		# armazena a conexão para ser usada pelas próximas janelas filhas
		self.conn = conn

		# chama os métodos de criação dos componentes das janelas
		self.create_widgets()
		self.create_menu()

		# define o que acontece quando o usuário clica no 'X' da janela
		self.protocol("WM_DELETE_WINDOW", self.on_closing)

	# cria os widgets da janela principal
	# ex: labels, imagens, etc. O que quisermos inserir
	def create_widgets(self):
		# label de boas-vindas
		label = tk.Label(
			self,
			text="Bem-vindo ao Sistema de Gestão de Loja - VOUCHER",
			font=("Arial",18,"bold"), #  tipo da fonte, tamanho e estilo
			pady=20
		)
		label.pack(expand=True)

	# cria a barra de menu superior, do lado esquerdo da tela
	def create_menu(self):
		menubar = tk.Menu(self)

		# menu de cadastros
		cadastro_menu = tk.Menu(menubar, tearoff=0)
		
		# adiciona as opções que temos para cadastrar
		# e o que será feito após clicarmos nestas opções
		cadastro_menu.add_command(label="Clientes", command=self.abrir_janela_clientes)
		cadastro_menu.add_command(label="Funcionários", command=self.abrir_janela_funcionarios)
		cadastro_menu.add_command(label="Produtos", command=self.abrir_janela_produtos)
		cadastro_menu.add_command(label="Marcas", command=self.abrir_janela_marcas)

		# adiciona uma linha separadora
		cadastro_menu.add_separator() 		

		# Opcao de sair do sistema
		cadastro_menu.add_command(label="Sair", command=self.on_closing)

		# adiciona o menus "Cadastros" à barra principal
		menubar.add_cascade(label="Cadastros", menu=cadastro_menu)

		# configura a janela para usar esta barra de menus
		self.config(menu=menubar)

	# Abre a janela do cliente 
	def abrir_janela_clientes(self):
		ClienteWindow(self, self.conn)
	
	# Abre a janela de cadastro do funcionario
	def abrir_janela_funcionarios(self):
		FuncionarioWindow(self, self.conn)

	# abre a janela de marcas
	def abrir_janela_marcas(self):
		MarcaWindow(self, self.conn)
	
	# abre a janela dos produtos,,
	def abrir_janela_produtos(self):
		ProdutoWindow(self, self.conn)

	def on_closing(self):
		# função para fechar a janela, sair do sistema
		if messagebox.askokcancel("Sair","Você tem certeza que deseja sair?"):
			self.destroy() # encerra a janela