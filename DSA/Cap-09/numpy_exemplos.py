# importanto o numpy

import numpy as dsa
dsa.__version__

arr1 = dsa.array([1,2,3,4,5])

print(arr1)


# cria um array com zeros 
array_zeros = dsa.zeros(10)

print(array_zeros)

# cria uma matriz com 1 na diagonal
matriz_diagonal = dsa.eye(3)

print("\nMatriz normal \n", matriz_diagonal)

# cria uma matriz na diagonal
# com valores passados por parametro
matriz_diagonal_parametrizada = dsa.diag(dsa.array([1, 2, 3, 4]))

print("\nMatriz parametrizada \n", matriz_diagonal_parametrizada)

