from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service)

driver.get("https://www.google.com")

search_box = driver.find_element(by=By.NAME, value="q")
search_box.send_keys("Automação com Selenium")
search_box.submit()

driver.quit()
