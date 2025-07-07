import streamlit as st
import matplotlib.pyplot as plt
import numpy as np

def plot_swot_matrix(strengths, weaknesses, opportunities, threats):
    """
    Gera e exibe uma matriz SWOT utilizando Matplotlib.
    """
    fig, axs = plt.subplots(2, 2, figsize=(8, 8))
    fig.suptitle('Análise SWOT', fontsize=16)

    # Configurações dos quadrantes
    quadrants = {
        'Forças': (0, 0, strengths, 'lightgreen'),
        'Fraquezas': (0, 1, weaknesses, 'lightcoral'),
        'Oportunidades': (1, 0, opportunities, 'lightblue'),
        'Ameaças': (1, 1, threats, 'lightgray')
    }

    for title, (row, col, data, color) in quadrants.items():
        ax = axs[row, col]
        ax.set_title(title, fontsize=14, fontweight='bold')
        ax.set_facecolor(color)
        ax.set_xticks([])
        ax.set_yticks([])

        # Adiciona o texto do usuário ao quadrante
        ax.text(0.5, 0.5, data, ha='center', va='center', wrap=True, fontsize=10,
                bbox=dict(boxstyle='round,pad=0.5', fc='white', alpha=0.8))

    plt.tight_layout(rect=[0, 0.03, 1, 0.95])
    st.pyplot(fig)


# --- Interface do Usuário com Streamlit ---

st.title('Gerador de Matriz SWOT Interativa')

st.write("Insira os dados para cada categoria da análise SWOT abaixo:")

# Campos de texto para a entrada de dados
strengths_input = st.text_area("Forças (Strengths)", height=150)
weaknesses_input = st.text_area("Fraquezas (Weaknesses)", height=150)
opportunities_input = st.text_area("Oportunidades (Opportunities)", height=150)
threats_input = st.text_area("Ameaças (Threats)", height=150)

# Botão para gerar a matriz
if st.button('Gerar Matriz SWOT'):
    if strengths_input and weaknesses_input and opportunities_input and threats_input:
        plot_swot_matrix(strengths_input, weaknesses_input, opportunities_input, threats_input)
    else:
        st.warning("Por favor, preencha todos os campos para gerar a matriz.")