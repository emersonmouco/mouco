import streamlit as st
import pandas as pd
from statsmodels.tsa.statespace.sarimax import SARIMAX
from statsmodels.tsa.seasonal import seasonal_decompose
import matplotlib.pyplot as plt
from datetime import date
from io import StringIO

st.set_page_config(page_title="Sistema de análise e previsão de séries temporais", 
                   layout="wide")

st.title("Sistema de análise e previsão de séries temporais")

with st.sidebar:
    upload_file = st.file_uploader("Escolha o arquivo: ", type=['csv'])
    if upload_file is not None:
        string_io = StringIO(upload_file.getvalue().decode("utf-8"))
        
        df = pd.read_csv(string_io, header=None)

        data_inicio = date(2000,1,1)
        
        periodo = st.date_input("Período inicial da série: ",data_inicio)

        periodo_previsao = st.number_input("Informe quantos meses quer prever: ", min_value=1, max_value=48, value=12) # value é o valor padrao
        
        processar = st.button("Processar")