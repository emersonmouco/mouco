import tkinter as tk
import ttkbootstrap as ttk
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import matplotlib.pyplot as plt

class DashboardFrame(ttk.Frame):
	def __init__(self, master, conn):
		super().__init__(master, padding=(20,10))
		self.conn = conn

		# configurando o grid principal da dashboard
		self.columnconfigure((0,1), weight=1)
		self.rowconfigure(1, weight=1)

		# criando os blocos do dashboard
		self.criar_kpi_cards()
		self.criar_grafico_produtos_por_marca()
		# self.criar_lista_clientes()

	def criar_kpi_cards(self):
		# criando os cartoes da função criar kpi cards
		frame_kpi = ttk.Frame(self)
		frame_kpi.grid(row = 0, column=0, columnspan=2,
				 sticky="ew", pady=(0,20))
		frame_kpi.columnconfigure(
			(0,1,2), weight=1
		)

		# dados para os cards (cartoes)
		dados_kpi = [
			# chave     valor
            {"titulo": "Clientes Totais", "valor": "142", "bootstyle": "primary"},
            {"titulo": "Produtos Cadastrados", "valor": "78", "bootstyle": "success"},
            {"titulo": "Marcas Parceiras", "valor": "15", "bootstyle": "info"}
        ]

		for i, dados in enumerate(dados_kpi):
			card = ttk.Frame(
				frame_kpi, padding=20,
				bootstyle=f"{dados['bootstyle']}.TFrame"
			)
			# irá apresentar as colunas/variaveis
			# dos dados que temos no conjunto de dados acima
			card.grid(row=0, column=i, padx=10, sticky="ew")

			ttk.Label(
				card, text=dados['valor'],
				font=("Arial", 24, "bold"),
				bootstyle=f"inverse-{dados['bootstyle']}"
			).pack()
			ttk.Label(
				card, text=dados['titulo'],
				font=("Arial", 10),
				bootstyle=f"inverse-{dados['bootstyle']}"
			).pack()
	
	def criar_grafico_produtos_por_marca(self):
		# criando um gráfico com o matplotlib e exibindo
		frame_grafico = ttk.LabelFrame(
			self,
			text = "Produtos por marca",
			padding=15
		)
		frame_grafico.grid(row=1, column=0, sticky="nsew", padx=(0, 10))

		# dados
		marcas = ['Dell', 'Lenovo', 'Samsung', 'Avell', 'Apple']
		produtos = [15, 24, 19, 10, 7]

		# estilização, estilo do gráfico
		plt.style.use('seaborn-v0_8-whitegrid')

		# criando a figura e os eixos do gráfico
		fig = Figure(figsize=(5,4), dpi=100)
		ax = fig.add_subplot(111)

		# criando as barras 
		bars = ax.bar(marcas, produtos, color='#3498db')
		ax.set_title('Total de Produtos de cada marca', fontsize=12)
		ax.set_ylabel('Produtos', fontsize=10)

		# removendo as bordas do gráfico
		ax.spines['top'].set_visible(False)
		ax.spines['right'].set_visible(False)

		# qualidade boa do layout
		fig.tight_layout()

		# adicionando o gráfico ao tkinter
		canvas = FigureCanvasTkAgg(fig, master=frame_grafico)
		canvas.draw()
		canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=True)