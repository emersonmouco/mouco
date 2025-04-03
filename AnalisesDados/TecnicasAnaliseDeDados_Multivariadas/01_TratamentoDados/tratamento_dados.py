import sklearn
import scipy
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import missingno as msno
from scipy.stats import shapiro
from scipy.stats import mannwhitneyu
from sklearn.impute import KNNImputer
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from datetime import datetime
import warnings

# lendo o arquivo csv
df = pd.read_csv("dataset.csv")

# mostrando a quantidade de linhas e colunas
# 2237 linhas - 25 colunas (variaveis)
print(df.shape)


print(df.head())

print(df.info())