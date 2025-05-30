from funcionario import Funcionario
from cliente import Cliente
from cargo import Cargo

from tkinter import *
from tkinter import ttk


"""
# coletando dados do cargo
nomeCargo = input("Informe o cargo: ")
descricaoCargo = input("Informe a descrição do cargo: ")
salarioBase = float(input("Informe o salário base do cargo: R$ "))

# atribuindo ao objeto cargo, os dados coletados do usuário
cargo = Cargo(nomeCargo, descricaoCargo, salarioBase)

# coletando dados  do funcionário
nomeFuncionario = input("Informe o nome do funcionário: ")
idadeFuncionario = input("Informe a idade do funcionário: ")
telefoneFuncionario = input("Informe o telefone do funcionário: ")
rgFuncionario = input("Informe o RG do funcionário: ")
cidadeFuncionario = input("Informe a cidade do funcionário: ")
codigoFuncionario = input("Informe o código do funcionário: ")
senhaFuncionario = input("Informe a senha do funcionário: ")

funcionario = Funcionario(nomeFuncionario, idadeFuncionario,
						  telefoneFuncionario, rgFuncionario, 
						  cidadeFuncionario, codigoFuncionario, 
						  senhaFuncionario, cargo)

# exibindo dados do funcionário
funcionario.apresentar()
funcionario.mostrar_cargo()

# coletando dados do cliente
nomeCliente = input("Informe o nome do Cliente: ")
idadeCliente = input("Informe a idade do cliente: ")
telefoneCliente = input("Informe o telefone do cliente: ")
rgCliente = input("Informe o RG do cliente: ")
cidadeCliente = input("Informe a cidade do cliente: ")
nivelCliente = int(input("Informe o nível do cliente: "))

cliente = Cliente(nomeCliente, idadeCliente,
				  telefoneCliente, rgCliente, 
				  cidadeCliente, nivelCliente)

# exibindo dados do cliente
cliente.apresentar()
cliente.mostrar_cliente()

"""

root = Tk()
frm = ttk.Frame(root, padding=10)
frm.grid()
ttk.Label(frm, text="Hello World!").grid(column=0, row=0)
ttk.Button(frm, text="Quit", command=root.destroy).grid(column=1, row=0)
root.mainloop()

