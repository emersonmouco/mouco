import tkinter as tk
from tkinter import ttk, messagebox
from db import database_manager as db
from models.marca import Marca

class MarcaWindow(tk.Toplevel):
	def __init__(self, master, conn):
		super().__init__(master)
		self.title("Cadastro de Marca")
		self.geometry("500x400")
		self.conn = conn
		self.id_selecionado = None # caso seja uma alteração e não um cadastro

		frame_form = ttk.LabelFrame(self, text="Dados da Marca")
		frame_form.pack(padx=10, pady=10, fill="x")

		# label nome da marca
		ttk.Label(frame_form, text="Nome: ").grid(row=0, column=0, padx=5, pady=5, sticky="w")
		# caixa de texto do nome da marca
		self.entry_nome = ttk.Entry(frame_form, width=40)
		self.entry_nome.grid(row=0, column=1, padx=5, pady=5)

		# label da descricao
		ttk.Label(frame_form, text="Descrição: ").grid(row=1, column=0, padx=5, pady=5, sticky="w")
		# caixa de texto da descrição da marca
		self.entry_descricao = ttk.Entry(frame_form, width=40)
		self.entry_descricao.grid(row=1, column=1, padx=5, pady=5)


		# botoes de ações
		frame_botoes = ttk.Frame(self)
		frame_botoes.pack(pady=10)

		# botao de cadastrar
		ttk.Button(frame_botoes, text="Salvar", command=self.cadastrar_marca).pack(side=tk.LEFT, padx=5)
		# botao de excluir
		ttk.Button(frame_botoes, text="Excluir", command=self.excluir_marca).pack(side=tk.LEFT, padx=5)
		# botao de limpar
		ttk.Button(frame_botoes, text="Limpar", command=self.limpar_formulario).pack(side=tk.LEFT, padx=5)

		# tabela de visualização de marcas cadastradas
		frame_lista = ttk.LabelFrame(self, text="Marcas cadastradas")
		frame_lista.pack(padx=10, pady=10, fill="both", expand=True)

		self.tree = ttk.Treeview(frame_lista, columns=("id","nome", "descrição"), show="headings")
		self.tree.heading("id", text="ID");self.tree.column("id", width=40)
		self.tree.heading("nome", text="Nome")
		self.tree.heading("descrição", text="Descrição");self.tree.column("descrição", width=40)
		self.tree.pack(fill="both", expand=True)
		self.tree.bind('<<TreeviewSelect>>', self.ao_selecionar_item)

		self.carregar_marcas()

	# cadastrar marca
	def cadastrar_marca(self):
		nome = self.entry_nome.get()
		descricao = self.entry_descricao.get()

		if not nome:
			messagebox.showerror("Erro", "Nome é obrigatório!")
			return
		
		try:
			# objeto marca
			marca = Marca(id=self.id_selecionado, nome=nome, descricao=descricao)

			marca.save(self.conn)

			acao = "atualizado" if self.id_selecionado else "criado"
			messagebox.showinfo("Sucesso", f"Marca {acao} com sucesso!")

			self.limpar_formulario()
			self.carregar_marcas()
		
		except Exception as e:
			messagebox.showerror("Erro ao salvar", f"Não foi possível salvar a marca. \nErro: {e}")
	
	def ao_selecionar_item(self, event):
		selecionado = self.tree.selection()
		if not selecionado: return

		item = self.tree.item(selecionado[0], 'values')
		self.id_selecionado = item[0]
		self.entry_nome.delete(0, tk.END); self.entry_nome.insert(0, item[1])
		self.entry_descricao.delete(0, tk.END); self.entry_descricao.insert(0, item[2])
	
	def limpar_formulario(self):
		self.id_selecionado = None
		self.entry_nome.delete(0, tk.END)
		self.entry_descricao.delete(0, tk.END)
		
		if self.tree.selection():
			self.tree.selection_remove(self.tree.selection()[0])
	
	def excluir_marca(self):
		if self.id_selecionado is None:
			messagebox.showwarning("Aviso","Selecione uma marca para excluir!")
			return
		
		if messagebox.askyesno("Confirmar exclusão","Tem certeza que deseja excluir esta marca?"):
			try:
				db.excluir_marca(self.conn, self.id_selecionado)
				messagebox.showinfo("Sucesso", "Marca excluída com sucesso!")
				self.limpar_formulario()
				self.carregar_marcas()
			except Exception as e:
				messagebox.showerror("Erro ao excluir", f"Não foi possível excluir a marca. \nErro: {e}")

	def carregar_marcas(self):
		for marca in self.tree.get_children():
			self.tree.delete(marca)
		
		# agora o listar_marcas faz um join no banco e trará
		# as marcas que ficaram após a exclusão
		marcas = db.listar_marcas(self.conn)
		for marca in marcas:
			self.tree.insert("", "end", values=(marca['id_marca'], marca['nome_marca'], marca['descricao_marca']))
	
	

	
