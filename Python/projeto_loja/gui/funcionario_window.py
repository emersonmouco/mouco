# criarem o funcionário

# atributos de funcionario
# cargo e salario

import tkinter as tk 
from tkinter import ttk, messagebox 
from db import database_manager as db 
from models.funcionario import Funcionario 

class FuncionarioWindow(tk.Toplevel):
	def __init__(self, master, conn):
		super().__init__(master)
		self.title("Cadastro de Funcionários")
		self.geometry("600x450")
		self.conn = conn 
		self.id_selecionado = None 

		frame_form = ttk.LabelFrame(self, text="Dados do Funcionário")
		frame_form.pack(padx=10, pady=10, fill="x")

		ttk.Label(frame_form, text="Nome: ").grid(row=0, column=0, padx=5,pady=5, sticky="w")
		self.entry_nome = ttk.Entry(frame_form, width=40)
		self.entry_nome.grid(row=0, column=1, padx=5, pady=5)
		
		ttk.Label(frame_form, text="Endereço:").grid(row=1, column=0, padx=5, pady=5, sticky="w")
		self.entry_endereco = ttk.Entry(frame_form, width=20)
		self.entry_endereco.grid(row=1, column=1, padx=5, pady=5, sticky="w")

		ttk.Label(frame_form, text="Salário:").grid(row=2, column=0, padx=5, pady=5, sticky="w")
		self.entry_salario = ttk.Entry(frame_form, width=20)
		self.entry_salario.grid(row=2, column=1, padx=5, pady=5)

		ttk.Label(frame_form, text="Cargo:").grid(row=3, column=0, padx=5, pady=5, sticky="w")
		self.entry_cargo = ttk.Entry(frame_form, width=20)
		self.entry_cargo.grid(row=3, column=1, padx=5, pady=5)
		
		

		# --- Botões de Ação ---
		frame_botoes = ttk.Frame(self)
		frame_botoes.pack(pady=5)
		ttk.Button(frame_botoes, text="Salvar", command=self.cadastrar_funcionario).pack(side=tk.LEFT, padx=5)
		ttk.Button(frame_botoes, text="Excluir", command=self.excluir_funcionario).pack(side=tk.LEFT, padx=5)
		ttk.Button(frame_botoes, text="Limpar", command=self.limpar_formulario).pack(side=tk.LEFT, padx=5)

		# --- Tabela de Visualização ---
		frame_lista = ttk.LabelFrame(self, text="Funcionários Cadastrados")
		frame_lista.pack(padx=10, pady=10, fill="both", expand=True)
		
		self.tree = ttk.Treeview(frame_lista, columns=("id", "nome","endereco",
												 "salario", "cargo"), show="headings")
		self.tree.heading("id", text="ID"); self.tree.column("id", width=40)
		self.tree.heading("nome", text="Nome")
		self.tree.heading("endereco", text="Endereço")
		self.tree.heading("salario", text="Salario")
		self.tree.heading("cargo", text="Cargo")
		self.tree.pack(fill="both", expand=True)
		self.tree.bind('<<TreeviewSelect>>', self.ao_selecionar_item)
		
		self.carregar_funcionarios()
		
	def cadastrar_funcionario(self):
		nome = self.entry_nome.get()
		endereco = self.entry_endereco.get()
		salario_str = self.entry_salario.get().replace(",", ".")
		cargo = self.entry_cargo.get()

		if not nome:
			messagebox.showerror("Erro", "Nome é obrigatório.")
			return

		try:
			salario = float(salario_str)

			objeto_funcionario = Funcionario(id=self.id_selecionado, nome=nome, 
						 endereco=endereco,salario=salario, cargo=cargo)
			
			objeto_funcionario.save(self.conn)

			acao = "atualizado" if self.id_selecionado else "criado"
			messagebox.showinfo("Sucesso", f"Funcionário {acao} com sucesso!")
			
			self.limpar_formulario()
			self.carregar_funcionarios()

		except Exception as e:
			messagebox.showerror("Erro ao Salvar", f"Não foi possível salvar o funcionário.\nErro: {e}")
			
	def ao_selecionar_item(self, event):
		selecionado = self.tree.selection()
		if not selecionado: return
		
		item = self.tree.item(selecionado[0], 'values')
		self.id_selecionado = item[0]
		self.entry_nome.delete(0, tk.END); self.entry_nome.insert(0, item[1])
		self.entry_endereco.delete(0, tk.END); self.entry_endereco.insert(0, item[2])
		self.entry_salario.delete(0, tk.END); self.entry_salario.insert(0, item[3])
		self.entry_cargo.delete(0, tk.END); self.entry_cargo.insert(0, item[4])
		

	def limpar_formulario(self):
		self.id_selecionado = None
		self.entry_nome.delete(0, tk.END)
		self.entry_endereco.delete(0, tk.END)
		self.entry_salario.delete(0,tk.END)
		self.entry_cargo.delete(0, tk.END)
		
		if self.tree.selection():
			self.tree.selection_remove(self.tree.selection()[0])
			
	def excluir_funcionario(self):
		if self.id_selecionado is None:
			messagebox.showwarning("Aviso", "Selecione um funcionário para excluir.")
			return
		
		if messagebox.askyesno("Confirmar Exclusão", "Tem certeza que deseja excluir este funcionário?"):
			try:
				db.excluir_funcionario(self.conn, self.id_selecionado)
				messagebox.showinfo("Sucesso", "Funcionário excluído com sucesso!")
				self.limpar_formulario()
				self.carregar_funcionarios()
			except Exception as e:
				messagebox.showerror("Erro ao Excluir", f"Não foi possível excluir o funcionário.\nErro: {e}")

	def carregar_funcionarios(self):
		for i in self.tree.get_children():
			self.tree.delete(i)
		
		funcionarios = db.listar_funcionarios(self.conn)
		for funcionario in funcionarios:
			self.tree.insert("",
					"end",
					values=(
						funcionario['id_pessoa'],
			 			funcionario['nome_pessoa'],
						funcionario['endereco_pessoa'],
						funcionario['salario_funcionario'],
						funcionario['cargo_funcionario']
					)
			)

			
