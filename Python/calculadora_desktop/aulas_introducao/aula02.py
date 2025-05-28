import sys
from PySide6.QtWidgets import QApplication, QPushButton
from PySide6.QtWidgets import QWidget, QVBoxLayout

# para que nao abra duas janelas precisamos
# de um central widget e depois ajustamos os outros widgets
# dentro desse central

app = QApplication(sys.argv)

botao = QPushButton('Texto do Botão')

botao.setStyleSheet('font-size: 40px; color: red')
botao2 = QPushButton('Texto do Botão')

centralWidget = QWidget()

# QVBoxLayout -> layout na vertical
# QHBoxLayout -> layout na horizontal

layout = QVBoxLayout()
centralWidget.setLayout(layout)
layout.addWidget(botao)
layout.addWidget(botao2)

centralWidget.show()

# executa a aplicação
app.exec()