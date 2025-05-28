import sys
from PySide6.QtWidgets import QApplication, QPushButton

app = QApplication(sys.argv)

botao = QPushButton('Texto do Botão')

botao.setStyleSheet('font-size: 40px; color: red')

# adiciona o widget na hierarqui e exibe a janela
botao.show()

# Se eu colocar um segundo botao eu terei duas janelas
botao2 = QPushButton('Texto do Botão')
botao2.show()

# executa a aplicação
app.exec()