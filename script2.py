from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium import webdriver

global driver
driver = webdriver.Chrome(ChromeDriverManager().install())

driver.maximize_window()
driver.get("https://www.cowin.gov.in/home")     #visits website

#Function to Select a value from list
def selectVal(var):
    try:
        #finding all available options
        ele = driver.find_elements_by_class_name("mat-option-text")

        #finding the index of the option according to the var state
        num=0
        for x in range(0,len(ele)):
            if ele[x].text==var:
                num=x
                break

        #finding state's list again 
        ele = driver.find_elements_by_class_name("mat-option-text")
        #clicking the specific state
        ele[x].click()
    except:
        print("stale eleement")

#Fucntion To search vaccine availabiility using State and District
def searchbyStatenDistrict(state,district):
    driver.find_element_by_class_name("status-switch").click()
    driver.find_element_by_id("mat-select-0").click()
    selectVal(state)
    driver.find_element_by_id("mat-select-2").click()
    selectVal(district)
    driver.find_element_by_xpath("/html/body/app-root/div/app-home/div[2]/div/appointment-table/div/div/div/div/div/div/div/div/div/div/div[2]/form/div/div/div[2]/div/div[3]/button").click()

#Function To search vaccine availabilty using pin code
def searchByPin(pincode):
    #finding the pin input field
    elem = driver.find_element_by_id("mat-input-0")
    #sending the pin code
    elem.send_keys(pin)
    #clicking on search
    driver.find_element_by_xpath("/html/body/app-root/div/app-home/div[2]/div/appointment-table/div/div/div/div/div/div/div/div/div/div/div[2]/form/div/div/div[2]/div/div/button").click()

#Function to evaluate the results found and calculate number of slots available 
def evalResults():
    results=[]
    try:
        ele = driver.find_element_by_link_text("No Vaccination center is available for booking.")
        print("No Vacc center is available for booking")
    except:
        print("Hola")
        try:
            a = driver.find_elements_by_xpath("/html/body/app-root/div/app-home/div[2]/div/appointment-table/div/div/div/div/div/div/div/div/div/div/div[2]/form/div/div/div[6]/div/div/div/div")
            count=len(a) 
            print(count)
            for x in range(1,count+1):
                b = driver.find_elements_by_xpath("/html/body/app-root/div/app-home/div[2]/div/appointment-table/div/div/div/div/div/div/div/div/div/div/div[2]/form/div/div/div[6]/div/div/div/div["+str(x)+"]/div/div/div[2]/ul/li")
                count2 = len(b)
                for y in range(1,count2+1):
                    c = driver.find_element_by_xpath("/html/body/app-root/div/app-home/div[2]/div/appointment-table/div/div/div/div/div/div/div/div/div/div/div[2]/form/div/div/div[6]/div/div/div/div["+str(x)+"]/div/div/div[2]/ul/li["+str(y)+"]/div/div/a")
                    results.append(c.text)            
        except:
            print("No Slots Available")
    sum =0
    for i in results:
        try:
            x = int(i)
            sum += x
        except:
            flag=1
    print(str(sum)+" slots available within 7 days from today")

#Function To select the filters like age 18+ and Free/ Paid etc    
def filter(age18=False,age45=False,covishield=False,covaxin=False,sputnikV=False,Free=False,Paid=False):
    ele = driver.find_elements_by_class_name("form-check-label")
    
    if age18==True:
        ele = driver.find_elements_by_class_name("form-check-label")
        ele[0].click()
        
    if age45==True:
        ele = driver.find_elements_by_class_name("form-check-label")
        ele[1].click()

    if covishield==True:
        ele = driver.find_elements_by_class_name("form-check-label")
        ele[2].click()

    if covaxin==True:
        ele = driver.find_elements_by_class_name("form-check-label")
        ele[3].click()


    if sputnikV==True:
        ele = driver.find_elements_by_class_name("form-check-label")
        ele[4].click()

    if Free==True:
        ele = driver.find_elements_by_class_name("form-check-label")
        ele[5].click()

    if Paid==True:
        ele = driver.find_elements_by_class_name("form-check-label")
        ele[6].click()
         
    

state="Gujarat"
district = "Valsad"
pin="380055"

#Function Calls


searchbyStatenDistrict(state,district)
#searchByPin(pin)
filter(Free=True)
evalResults()

# Emeregency Script To Find special elements like ::after and :: before
#script = "return window.getComputedStyle(document.querySelector('div.status-switch'),'::after').getPropertyValue('content')"
#msg = driver.execute_script(script).strip()
#print(msg)

#To Keep Driver alive
while True:
    pass
