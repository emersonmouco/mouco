# from django.db import models

"""

Você está certo, todo produto precisa de um ID. A boa notícia é: o Django cria um ID para você automaticamente!

Para cada modelo que você define, o Django adiciona um campo chamado id que é um número inteiro, auto-incrementado e que serve como chave primária (PK - Primary Key). Por isso, não precisamos declará-lo em nosso models.py. Ele já está lá, nos bastidores.

"""

# Arquivo: produtos/models.py (Temporário)

from django.db import models
# from core.models import Categoria, Marca # <--- COMENTE ESTA LINHA

class Produto(models.Model):
    nome = models.CharField(max_length=100)
    descricao = models.TextField(blank=True, null=True)
    preco = models.DecimalField(max_digits=10, decimal_places=2)
    estoque = models.PositiveIntegerField(default=0)
    disponivel = models.BooleanField(default=True)
    data_criacao = models.DateTimeField(auto_now_add=True)

    # COMENTE AS LINHAS QUE USAM OS MODELOS IMPORTADOS
    # categoria = models.ForeignKey(Categoria, on_delete=models.PROTECT, related_name='produtos')
    # marca = models.ForeignKey(Marca, on_delete=models.PROTECT, related_name='produtos')

    def __str__(self):
        return self.nome # Remova a marca da string por enquanto
