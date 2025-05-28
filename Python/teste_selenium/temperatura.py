from bs4 import BeautifulSoup
import requests

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36'
}

try:
    response = requests.get("https://www.climatempo.com.br/", headers=headers)
    response.raise_for_status()  # Verifica erros HTTP
    html = response.content
except requests.exceptions.RequestException as e:
    print(f"Erro ao acessar o site: {e}")
    exit()

soup = BeautifulSoup(html, 'html.parser')

# Exemplo de seletor alternativo (ajuste conforme o site atual)
temperatura = soup.find("span", class_="temp")

if temperatura:
    print(f"Temperatura atual: {temperatura.get_text(strip=True)}")
else:
    print("Elemento da temperatura não encontrado.")
