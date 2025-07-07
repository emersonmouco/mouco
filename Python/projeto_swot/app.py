from flask import Flask, render_template, request
import plotly.graph_objects as go
import plotly.io as pio

app = Flask(__name__, template_folder="pages")

def create_swot_plot(strengths, weaknesses, opportunities, threats):
    """
    Cria uma figura de matriz SWOT interativa com Plotly.
    """
    fig = go.Figure()

    # Adicionando formas como fundo para os quadrantes
    fig.add_shape(type="rect", xref="paper", yref="paper", x0=0, y0=0.5, x1=0.5, y1=1, fillcolor="#B3E2CD", layer="below", line_width=0)
    fig.add_shape(type="rect", xref="paper", yref="paper", x0=0.5, y0=0.5, x1=1, y1=1, fillcolor="#FDCDAC", layer="below", line_width=0)
    fig.add_shape(type="rect", xref="paper", yref="paper", x0=0, y0=0, x1=0.5, y1=0.5, fillcolor="#CBD5E8", layer="below", line_width=0)
    fig.add_shape(type="rect", xref="paper", yref="paper", x0=0.5, y0=0, x1=1, y1=0.5, fillcolor="#F4CAE4", layer="below", line_width=0)

    # Função para formatar o texto com quebras de linha em HTML
    def format_text(text):
        return '<br>'.join(text.split('\n'))

    # Adicionando anotações (texto) para cada quadrante
    fig.add_annotation(x=0.25, y=0.75, text=f"<b>Forças</b><br><br>{format_text(strengths)}", showarrow=False, font=dict(size=14, color="black"), align="center")
    fig.add_annotation(x=0.75, y=0.75, text=f"<b>Fraquezas</b><br><br>{format_text(weaknesses)}", showarrow=False, font=dict(size=14, color="black"), align="center")
    fig.add_annotation(x=0.25, y=0.25, text=f"<b>Oportunidades</b><br><br>{format_text(opportunities)}", showarrow=False, font=dict(size=14, color="black"), align="center")
    fig.add_annotation(x=0.75, y=0.25, text=f"<b>Ameaças</b><br><br>{format_text(threats)}", showarrow=False, font=dict(size=14, color="black"), align="center")

    # Atualizando o layout do gráfico
    fig.update_layout(
        title_text='Análise SWOT Interativa',
        title_x=0.5,
        title_font_size=24,
        xaxis=dict(showgrid=False, zeroline=False, showticklabels=False),
        yaxis=dict(showgrid=False, zeroline=False, showticklabels=False),
        plot_bgcolor='#FFFFFF',
        margin=dict(l=20, r=20, t=60, b=20)
    )
    
    # Convertendo a figura para HTML
    return pio.to_html(fig, full_html=False)

@app.route('/', methods=['GET', 'POST'])
def index():
    swot_plot_html = None
    if request.method == 'POST':
        # Coleta os dados do formulário
        strengths = request.form.get('strengths')
        weaknesses = request.form.get('weaknesses')
        opportunities = request.form.get('opportunities')
        threats = request.form.get('threats')
        
        # Gera o gráfico se todos os campos forem preenchidos
        if all([strengths, weaknesses, opportunities, threats]):
            swot_plot_html = create_swot_plot(strengths, weaknesses, opportunities, threats)

    return render_template('index.html', swot_plot=swot_plot_html)

if __name__ == '__main__':
    app.run(debug=True)