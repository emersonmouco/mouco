import tkinter as tk
from tkinter import ttk, messagebox
from db import database_manager as db
from models.produto import Produto
from models.marca import Marca

class ProdutoWindow(tk.Toplevel):
	def __init__(self, master, conn):
		super().__init__(master)
		self.title("Cadastro de Produtos")
		self.geometry("600x500")
		self.conn = conn
		self.id_selecionado = None
		self.marcas_map = {} # utilizamos aqui um dicionário para trazer as marcas 
		# cadastradas para poder cadastrar o produto

		# --- Formulario de cadastro ---
		frame_form = ttk.LabelFrame(self, text="Dados do produto")
		frame_form.pack(padx=10, pady=10, fill="x")

		ttk.Label(frame_form, text="Nome: ").grid(row=0, column=0, padx=5, pady=5, sticky="w")
		self.entry_nome = ttk.Entry(frame_form, width=40)
		self.entry_nome.grid(row=0, column=1, padx=5, pady=5)

		ttk.Label(frame_form, text="Preço (R$): ").grid(row=1, column=0, padx=5, pady=5, sticky="w")
		self.entry_preco = ttk.Entry(frame_form, width=40)
		self.entry_preco.grid(row=1, column=1, padx=5, pady=5)

		ttk.Label(frame_form, text="Descrição: ").grid(row=2, column=0, padx=5, pady=5, sticky="w")
		self.entry_descricao = ttk.Entry(frame_form, width=40)
		self.entry_descricao.grid(row=2, column=1, padx=5, pady=5)

		ttk.Label(frame_form, text="Marca: ").grid(row=3, column=0, padx=5, pady=5, sticky="w")
		self.combo_marca = ttk.Combobox(frame_form, state="readonly", width=40)
		self.combo_marca.grid(row=3, column=1, padx=5, pady=5)
		self.carregar_marcas_combobox()

		# --- botões --- 
		frame_botoes = ttk.Frame(self)
		frame_botoes.pack(pady=10)
		ttk.Button(frame_botoes, text="Salvar", command=self.cadastrar_produto).pack(side=tk.LEFT, padx=5)
		ttk.Button(frame_botoes, text="Excluir", command=self.excluir_produto).pack(side=tk.LEFT, padx=5)
		ttk.Button(frame_botoes, text="Limpar", command=self.limpar_formulario).pack(side=tk.LEFT, padx=5)

		# --- tabela ---
		frame_lista = ttk.LabelFrame(self, text="Produtos Cadastrados")
		frame_lista.pack(padx=10, pady=10, fill="both", expand=True)

		colunas = ("id", "nome", "preco", "descricao", "marca")
		self.tree = ttk.Treeview(frame_lista, columns=colunas, show="headings")
		self.tree.heading("id", text="ID"); self.tree.column("id", width=20)
		self.tree.heading("nome", text="Nome")
		self.tree.heading("preco", text="Preço"); self.tree.column("preco", width=20)
		self.tree.heading("descricao", text="Descrição")
		self.tree.heading("marca", text="Marca"); self.tree.column("marca", width=20)
		self.tree.pack(fill="both", expand=True)
		self.tree.bind('<<TreeviewSelect>>', self.ao_selecionar_item)
	
	def carregar_marcas_combobox(self):
		# carregar as marcas cadastradas para cadastrar o produto
		marcas_db = db.listar_marcas(self.conn)
		self.marcas_map.clear()
		nomes_marcas = []
		if marcas_db:
			for marca_data in marcas_db:
				# criando objeto marca para cada registro do banco
				marca_obj = Marca(id=marca_data['id_marca'], 
					  nome=marca_data['nome_marca'], descricao=marca_data['descricao_marca'])
				self.marcas_map[marca_obj.nome] = marca_obj
				nomes_marcas.append(marca_obj.nome)
		
		self.combo_marca['values'] = nomes_marcas
	
	def cadastrar_produto(self):
		nome = self.entry_nome.get()
		preco_str = self.entry_preco.get().replace(",", ".") # ele irá substituir a vírgula por ponto
		descricao = self.entry_descricao.get()
		marca_nome = self.combo_marca.get()

		# se pelo menos algum dos campos não estiver preenchido
		# ele irá emitir a mensagem de erro
		if not all([nome, preco_str, marca_nome]):
			messagebox.showerror("Erro de validação.",
						"Nome, Preço e Marca são obrigatórios!")
			return
		
		try:
			preco = float(preco_str) # converto a string para o float
			# Aqui eu poderia pegar todos os atributos da marca selecionada
			# porém como só me interessa o nome, por isso passo somente o nome 
			# como parâmetro
			marca_selecionada = self.marcas_map[marca_nome]
		except ValueError:
			messagebox.showerror("Erro de validação.",
						"O preço deve ser um número válido.")
			return
		except KeyError:
			messagebox.showerror("Erro de validação.",
						"A marca selecinada é inválida!")
			return
		
		try:
			# cria o objeto produto
			objeto_produto = Produto(id=self.id_selecionado, nome=nome, 
							preco=preco, descricao=descricao, marca=marca_selecionada)
			
			# salvando os dados de produto no banco de dados
			objeto_produto.save(self.conn)

			# se já existir um ID selecionado é porque estamos querendo alterar
			# se nao, é porque estamos cadastrando
			acao = "atualizado" if self.id_selecionado else "cadastrado"
			messagebox.showinfo("Sucesso", f"Produto {acao} com sucesso!")

			self.limpar_formulario()
			self.carregar_produtos()
		except Exception as e:
			messagebox.showerror("Erro no banco de dados",
						f"não foi possível salvar os dados do produto. Erro: {e}")
		
	def ao_selecionar_item(self, event):
		selecionado = self.tree.selection()
		
		# se não tiver nada selecionado, ele da apenas um return
		# e não acontece nada
		if not selecionado: return

		item = self.tree.item(selecionado[0], 'values')
		self.limpar_formulario()

		self.id_selecionado = item[0]
		self.entry_nome.insert(0, item[1])
		preco_str = str(item[2]).replace("R$","").strip() # aqui ele só irá substituir o cifrão se existir
		self.entry_preco.insert(0, preco_str)
		self.entry_descricao.insert(0, item[3])
		# neste caso eu uso o set, pq os dados já existem, então eu apenas 
		# carrego e "seto"/coloco eles para serem selecionados na alteracao do produto
		# para eu alterar o que já existe de dados cadastrados de marca
		# eu precisaria ir no cadastro de marca, por isso eu uso o set ao inves de insert
		self.combo_marca.set(item[4])
	
	def limpar_formulario(self):
		self.id_selecionado = None
		self.entry_nome.delete(0, tk.END)
		self.entry_preco.delete(0, tk.END)
		self.entry_descricao.delete(0, tk.END)
		self.combo_marca.set('')
		if self.tree.selection():
			self.tree.selection_remove(self.tree.selection()[0])
	
	def carregar_produtos(self):
		for i in self.tree.get_children():
			self.tree.delete(i)

		produtos = db.listar_produtos(self.conn)
		for produto in produtos:
			dados_produto = (
				produto['id_produto'],
				produto['nome_produto'],
				f"R$ {produto['preco_produto']:.2f}",
				produto['descricao_produto'],
				produto['nome_marca']
			)
			self.tree.insert("","end",values=dados_produto)
	
	def excluir_produto(self):
		if not self.id_selecionado:
			messagebox.showwarning("Aviso", "Selecione um produto para excluir.")
			return
		
		if messagebox.askyesno("Confirmar exclusão",
						 f"Tem certeza que deseja excluir o produto {self.id_selecionado}?"):
			try:
				db.excluir_produto(self.conn, self.id_selecionado)
				messagebox.showinfo("Sucesso", "produto excluído com sucesso!")
				self.limpar_formulario()
				self.carregar_produtos()
			except Exception as e:
				messagebox.showerror("Erro no banco de dados",
						 f"não foi possível excluir o produto. \nErro: {e}")
				