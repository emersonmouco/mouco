import tkinter as tk # pacote visual
import ttkbootstrap as ttkB # bootstrap do TKinter
from tkinter import ttk, messagebox # pacote visual
from db import database_manager as db # arquivo de conexão com o banco
from models.cliente import Cliente # model do Cliente para criarmos o objeto Cliente

class ClienteWindow(ttkB.Toplevel):
	def __init__(self, master, conn):
		super().__init__(master)
		self.title("Cadastro de Clientes") # titulo da janela
		self.geometry("600x450") # tamanho da janela
		self.conn = conn # parametro de conexão com o banco
		self.id_selecionado = None # atributo para pegar o id

		# --- Formulário para entrada de dados --- 
		frame_form = ttkB.LabelFrame(self, text="Dados do Cliente", padding=(15,10))
		frame_form.pack(padx=5, pady=5, fill="x")

		# todas as colunas ficarão responsivas de forma igual, com o mesmo "peso"
		frame_form.columnconfigure(1, weight=1)

		# Label do nome -> onde irá aparecer escrito Nomee
		# antes do campo de inserção
		ttkB.Label(frame_form, text="Nome: ").grid(row=0, column=0, padx=5,pady=8, sticky="w")
		
		# configuração da caixa de texto do nome
		# width=40 a caixa de texto do nome tera 40 pixels de largura
		# para essa janela estamos usando o sistema de grid
		# ou seja, será distribuido em linhas (row) e colunas (column)
		# row=0 ele será o primeiro elemento debaixo pra cima a aparecer na janela
		# é 0 pq vem da questão do vetor que sempre inicia em zero e nao em um a posição
		# column=1 quer dizer que a caixa de texto ocupara a segunda coluna do nosso grid,
		# pois a primeira coluna é do label 
		# padx e pady é a distancia em pixel que o atributo (label ou caixa de texto)
		# ficará da margem esquerda da tela (pady) e da margem debaixo (padx)
		# por exemplo, neste caso da caixa de texto do nome
		# ficará 5 pixels de distancia do lado esquerdo e 5 pixels de distancia da margem
		# debaixo dele
		self.entry_nome = ttkB.Entry(frame_form, width=40)
		self.entry_nome.grid(row=0, column=1, columnspan=2, padx=5, pady=5, sticky="ew")
		
		ttkB.Label(frame_form, text="CPF:").grid(row=1, column=0, padx=5, pady=5, sticky="w")
		self.entry_cpf = ttkB.Entry(frame_form, width=40)
		self.entry_cpf.grid(row=1, column=1, columnspan=2, padx=5, pady=5, sticky="ew")
		

		ttkB.Label(frame_form, text="Endereço:").grid(row=2, column=0, padx=5, pady=5, sticky="w")
		self.entry_endereco = ttkB.Entry(frame_form, width=20)
		self.entry_endereco.grid(row=2, column=1, columnspan=2, padx=5, pady=5, sticky="ew")

		ttkB.Label(frame_form, text="Email:").grid(row=3, column=0, padx=5, pady=5, sticky="w")
		self.entry_email = ttkB.Entry(frame_form, width=20)
		self.entry_email.grid(row=3, column=1, columnspan=2, padx=5, pady=5, sticky="ew")

		ttkB.Label(frame_form, text="Senha:").grid(row=4, column=0, padx=5, pady=5, sticky="w")
		
		# Campo de senha com variável de controle
		self.var_mostrar_senha = tk.BooleanVar(value=False)  # para controlar o estado
		self.entry_senha = ttkB.Entry(frame_form, width=10, show="*", textvariable=tk.StringVar())
		self.entry_senha.grid(row=4, column=1, columnspan=1, padx=5, pady=5, sticky="ew")

		# Botão para alternar visibilidade
		self.botao_mostrar = ttkB.Checkbutton(
    		frame_form,
    		text="Mostrar senha",
    		variable=self.var_mostrar_senha,
    		command=self.alternar_senha
		)
		self.botao_mostrar.grid(row=4, column=2, padx=5, pady=5)

		ttkB.Label(frame_form, text="Nível:").grid(row=5, column=0, padx=5, pady=5, sticky="w")

		self.niveis_disponiveis = ["1", "2", "3"]
		self.combo_nivel = ttkB.Combobox(frame_form, values=self.niveis_disponiveis, state="readonly")
		self.combo_nivel.grid(row=5, column=1, padx=5, pady=5, sticky="w")
		self.combo_nivel.set("1")  # valor padrão
		
		# --- Botões de Ação ---
		frame_botoes = ttkB.Frame(self, padding=(0,10))
		frame_botoes.pack(fill="none")
		ttkB.Button(frame_botoes, text="Salvar", command=self.salvar_cliente, style='info.TButton').pack(side=tk.LEFT, padx=5)
		ttkB.Button(frame_botoes, text="Excluir", command=self.excluir_cliente, style='info.TButton').pack(side=tk.LEFT, padx=5)
		ttkB.Button(frame_botoes, text="Limpar", command=self.limpar_formulario, style='info.TButton').pack(side=tk.LEFT, padx=5)
		
		
		# --- Tabela de Visualização ---
		frame_lista = ttkB.LabelFrame(self, text="Clientes Cadastrados")
		frame_lista.pack(padx=10, pady=10, fill="both", expand=True)
		
		self.tree = ttkB.Treeview(frame_lista, 
							columns=("id","nome", "endereco", "cpf","email", "senha", "nivel"), 
							show="headings",
							bootstyle="primary"
							)
		self.tree.heading("id", text="ID");
		self.tree.heading("nome", text="Nome")
		self.tree.heading("endereco", text="Endereço")
		self.tree.heading("cpf", text="CPF"); self.tree.column("cpf", width=120)
		self.tree.heading("email", text="E-mail")
		self.tree.heading("senha", text="Senha")
		self.tree.heading("nivel", text="Nível")
		self.tree.pack(fill="both", expand=True)
		self.tree.bind('<<TreeviewSelect>>', self.ao_selecionar_item)
		
		self.carregar_clientes()
		
	def salvar_cliente(self): #type: ignore
		nome = self.entry_nome.get()
		cpf = self.entry_cpf.get()
		endereco = self.entry_endereco.get()
		email = self.entry_email.get()
		senha = self.entry_senha.get()
		nivel = self.combo_nivel.get()
		
		if not nome or not cpf:
			messagebox.showerror("Erro", "Nome e CPF são obrigatórios.")
			return

		try:
			# 1. A janela apenas cria o objeto Cliente. Ela não sabe da existência 
			# de tabelas 'pessoa' e 'cliente' no banco de dados.
			objeto_cliente = Cliente(id=self.id_selecionado, nome=nome, cpf=cpf, 
						 endereco=endereco, email=email, senha=senha, nivel=nivel)
			
			# 2. A MÁGICA: A janela simplesmente confia no objeto para se salvar. 
			# Toda a complexidade de transações e múltiplos inserts está escondida
			# dentro do método 'save', que por sua vez chama o 'database_manager'.
			objeto_cliente.save(self.conn)

			acao = "atualizado" if self.id_selecionado else "criado"
			messagebox.showinfo("Sucesso", f"Cliente {acao} com sucesso!")
			
			self.limpar_formulario()
			self.carregar_clientes()

		except Exception as e:
			messagebox.showerror("Erro ao Salvar", f"Não foi possível salvar o cliente.\nErro: {e}")
		
			
	# Os métodos abaixo continuam exatamente os mesmos
	def ao_selecionar_item(self, event):
		selecionado = self.tree.selection()
		if not selecionado: return
		
		item = self.tree.item(selecionado[0], 'values')
		self.id_selecionado = item[0]
		self.entry_nome.delete(0, tk.END); self.entry_nome.insert(0, item[1])
		self.entry_endereco.delete(0, tk.END); self.entry_endereco.insert(0, item[2])
		self.entry_cpf.delete(0, tk.END); self.entry_cpf.insert(0, item[3])
		self.entry_email.delete(0, tk.END); self.entry_email.insert(0, item[4])
		self.entry_senha.delete(0, tk.END); self.entry_senha.insert(0, item[5])
		self.combo_nivel.delete(0, tk.END); self.combo_nivel.insert(0, item[6])

	def limpar_formulario(self):
		self.id_selecionado = None
		self.entry_nome.delete(0, tk.END)
		self.entry_cpf.delete(0, tk.END)
		self.entry_email.delete(0, tk.END)
		self.entry_senha.delete(0, tk.END)
		self.combo_nivel.delete(0, tk.END)
		if self.tree.selection():
			self.tree.selection_remove(self.tree.selection()[0])
			
	def excluir_cliente(self):
		if self.id_selecionado is None:
			messagebox.showwarning("Aviso", "Selecione um cliente para excluir.")
			return
		
		if messagebox.askyesno("Confirmar Exclusão", "Tem certeza que deseja excluir este cliente?"):
			try:
				# A lógica de exclusão também foi abstraída.
				db.excluir_cliente(self.conn, self.id_selecionado)
				messagebox.showinfo("Sucesso", "Cliente excluído com sucesso!")
				self.limpar_formulario()
				self.carregar_clientes()
			except Exception as e:
				messagebox.showerror("Erro ao Excluir", f"Não foi possível excluir o cliente.\nErro: {e}")

	def carregar_clientes(self):
		for i in self.tree.get_children():
			self.tree.delete(i)
		
		# O 'listar_clientes' agora faz um JOIN no banco, mas a janela não sabe disso.
		# Ela apenas recebe a lista de clientes prontinha para exibir.
		clientes = db.listar_clientes(self.conn)
		for cliente in clientes:
			self.tree.insert("", "end", values=(cliente['id_pessoa'], cliente['nome_pessoa'],
									   	cliente['cpf_cliente'],cliente['endereco_pessoa'],
										cliente['email_cliente'],cliente['senha_cliente'],
										cliente['nivel_cliente']))
	
	def alternar_senha(self):
		if self.var_mostrar_senha.get():
			self.entry_senha.config(show="")
		else:
			self.entry_senha.config(show="*")
