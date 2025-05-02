import streamlit as st
import pandas as pd
import patsy
from patsy import build_design_matrices
from scipy.special import expit
import pickle


# Carrega o modelo e fórmula
with open("modelo_logit.pkl", "rb") as f:
    model_package = pickle.load(f)

model = model_package["model"]
formula = model_package["formula"]

# Cria dummy para extrair design_info com a fórmula
dummy_data = pd.read_csv("candidato.csv")
dummy_data["atmale"] = dummy_data["atmale"].astype(str)
_, X_design = patsy.dmatrices(formula, data=dummy_data, return_type="dataframe")
design_info = X_design.design_info


st.title("Simulador de Escolha de Candidato - Análise Conjunta")

# Interface do usuário para entrada de atributos
st.sidebar.header("Defina os atributos do candidato")

atmilitary = st.sidebar.selectbox("Serviço militar", ['Served', 'Did Not Serve'])
atreligion = st.sidebar.selectbox("Religião", ['Catholic', 'None', 'Mormon', 'Mainline protestant'])
ated = st.sidebar.selectbox("Educação", ['No BA', 'Community college', 'Small college', 'Ivy League university', 'Baptist college'])
atprof = st.sidebar.selectbox("Profissão", ['Doctor', 'Farmer', 'Car dealer', 'High school teacher'])
atinc = st.sidebar.selectbox("Renda", ['32K', '54K', '65K', '5.1M'])
atrace = st.sidebar.selectbox("Etnia", ['White', 'Asian American', 'Native American'])
atmale = st.sidebar.selectbox("Sexo", ['Male', 'Female'])
atage = st.sidebar.slider("Idade", 25, 85, 55)

# Criar DataFrame com os dados do perfil
perfil = pd.DataFrame([{
    'atmilitary': atmilitary,
    'atreligion': atreligion,
    'ated': ated,
    'atprof': atprof,
    'atinc': atinc,
    'atrace': atrace,
    'atmale': atmale,
    'atage': atage
}])

# Construir matriz de design
X_sim = build_design_matrices([design_info], perfil)[0]

# Calcular probabilidade
prob = expit(model.predict(X_sim))[0]

# Mostrar resultado
st.subheader("Resultado da simulação")
st.write("**Probabilidade de escolha:** {:.1f}%".format(prob * 100))

# Mostrar dados do perfil escolhido
st.write("**Perfil simulado:**")
st.table(perfil)