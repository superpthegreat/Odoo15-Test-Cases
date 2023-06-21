from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.select import Select
import time

# You may want to study the following:
# https://selenium-python.readthedocs.io/locating-elements.html
# showing differnt ways of find_element(By. ...

# https://chromedriver.chromium.org/downloads
# Check this to make sure your Chrome and selenium driver versions match to each other (or, you may have weird problems)


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
time.sleep(3)

# Ning: the URL will be different in your case
# you need to check and modify
driver.get("http://localhost:8069/web#cids=1&menu_id=304&action=415")      # ID and ACTION numbers might need to be changed depending on machine, depends on where om_hospital app corresponds to
print("Test: I have invoked Hospital Patient app")
time.sleep(3)


#click on create button

create_button = driver.find_element(By.XPATH, "/html/body/div[1]/div/div[1]/div[2]/div[1]/div/div/button[3]")
create_button.click()
time.sleep(3)

# fill out patient name and age

search_bar = driver.find_element(By.NAME, "name")
search_bar.send_keys("Nye")

search_bar = driver.find_element(By.NAME, "age")
search_bar.send_keys("9")
time.sleep(3)


# save patient info0
save_button = driver.find_element(By.XPATH, "/html/body/div[1]/div/div[1]/div[2]/div[1]/div/div/div[2]/button[1]")
save_button.click()
print("Test: Patient created")

time.sleep(10)

driver.close()
exit(0)
