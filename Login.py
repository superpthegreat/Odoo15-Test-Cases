from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.select import Select
import time
#You may want to study the following:
#https://selenium-python.readthedocs.io/locating-elements.html
#showing differnt ways of find_element(By. ...

#https://chromedriver.chromium.org/downloads
#Check this to make sure your Chrome and selenium driver versions match to each other (or, you may have weird problems)


driver = webdriver.Chrome('./drivers/chromedriver')


def update_form_field(driver, field_name, field_value):
	search_bar = driver.find_element(By.NAME, field_name)
	search_bar.clear()
	time.sleep(1)
	search_bar.send_keys(field_value)


driver.get("http://localhost:8069/web/login")
print("Test: Step 1 passed")

update_form_field(driver, "login", "student@student.com")			# insert valid email here
update_form_field(driver, "password", "student")					# insert valid password here
driver.find_element(By.NAME, "login").send_keys(Keys.RETURN)
print("Test: I have logged in")

time.sleep(10)

driver.close()
exit(0)

