import streamlit as st
import pandas as pd
from sklearn.linear_model import LinearRegression
import numpy as np
import matplotlib.pyplot as plt

# --- Configuração da Página ---
st.set_page_config(page_title="Previsor de Gastos Totais", layout="wide")

# --- Função para Carregar Dados e Treinar o Modelo ---
# Usar o cache do Streamlit para evitar recarregar e treinar o modelo a cada interação
@st.cache_data
def load_and_train_model():
    # Carregar os dados
    try:
        df = pd.read_csv("telcoCustomerChurn.csv")
    except FileNotFoundError:
        st.error("Arquivo 'telcoCustomerChurn.csv' não encontrado. Certifique-se de que ele está no mesmo diretório do script.")
        return None, None, None, None, None

    # Pré-processamento dos dados (consistente com o modelo original)
    df_processed = df.copy()
    df_processed['TotalCharges'] = pd.to_numeric(df_processed['TotalCharges'], errors='coerce')
    
    # Lidar com valores ausentes (remoção para simplificar, como no exemplo original de regressão linear)
    df_processed.dropna(subset=['TotalCharges', 'tenure'], inplace=True)

    if df_processed.empty or df_processed['tenure'].isnull().any() or df_processed['TotalCharges'].isnull().any():
        st.error("Erro no pré-processamento: dados insuficientes ou com NaNs após a limpeza. Verifique o arquivo CSV.")
        return None, None, None, None, None

    # Selecionar as variáveis para o modelo
    X = df_processed[['tenure']]
    y = df_processed['TotalCharges']

    # Criar e treinar o modelo de Regressão Linear
    model = LinearRegression()
    model.fit(X, y)
    
    # Coeficientes para exibição
    coeficiente = model.coef_[0]
    intercepto = model.intercept_
    
    # Para o gráfico, podemos prever sobre os dados de treino
    y_pred_all = model.predict(X)

    return model, df_processed, X, y, coeficiente, intercepto, y_pred_all

# --- Carregar o modelo e os dados ---
model, df_data, X_data, y_data, coef, intercept, y_pred_all_data = load_and_train_model()

# --- Interface do Usuário ---
st.title("App de Previsão de Gastos Totais de Clientes Telco")
st.markdown("""
Esta aplicação utiliza um modelo de Regressão Linear Simples para prever os gastos totais (`TotalCharges`)
de um cliente com base no seu tempo de contrato (`tenure` em meses).
""")

if model is not None:
    col1, col2 = st.columns([1, 2])

    with col1:
        st.subheader("Faça sua Previsão")
        # Input do usuário para 'tenure'
        tenure_input = st.number_input(
            label="Tempo como cliente (meses):",
            min_value=0,
            max_value=100, # Ajuste conforme o range esperado
            value=24, # Valor padrão
            step=1
        )

        if st.button("Prever Gastos Totais"):
            if tenure_input is not None:
                # Preparar o input para o modelo
                input_data = pd.DataFrame({'tenure': [tenure_input]})
                # Fazer a previsão
                prediction = model.predict(input_data)[0]
                st.success(f"O gasto total previsto para {tenure_input} meses é: R$ {prediction:.2f}")
            else:
                st.warning("Por favor, insira um valor para 'tenure'.")

        st.subheader("Detalhes do Modelo de Regressão Linear")
        st.markdown(f"**Equação do Modelo:** `TotalCharges = {coef:.2f} * tenure + {intercept:.2f}`")
        st.write(f"**Coeficiente (Inclinação):** {coef:.2f}")
        st.write(f"Este valor indica que, em média, para cada mês adicional de contrato (tenure), os gastos totais aumentam em R$ {coef:.2f}.")
        st.write(f"**Intercepto:** {intercept:.2f}")
        st.write(f"Este é o valor previsto para `TotalCharges` quando `tenure` é 0. Pode não ter uma interpretação prática direta em todos os contextos.")

    with col2:
        st.subheader("Visualização da Regressão Linear")
        if X_data is not None and y_data is not None and y_pred_all_data is not None:
            fig, ax = plt.subplots(figsize=(10, 6))
            ax.scatter(X_data, y_data, color='skyblue', label='Dados Reais', alpha=0.7)
            ax.plot(X_data, y_pred_all_data, color='orangered', linewidth=2, label='Linha de Regressão (Modelo)')
            ax.set_xlabel("Tenure (meses)")
            ax.set_ylabel("Total Charges (Gastos Totais)")
            ax.set_title("Regressão Linear: Tenure vs. Total Charges")
            ax.legend()
            ax.grid(True, linestyle='--', alpha=0.7)
            st.pyplot(fig)
        else:
            st.write("Não foi possível gerar o gráfico pois os dados do modelo não estão disponíveis.")
else:
    st.error("O modelo não pôde ser carregado. Verifique os erros acima.")

st.markdown("---")
st.markdown("Desenvolvido com Streamlit e Scikit-learn.")