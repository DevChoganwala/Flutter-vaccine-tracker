import requests
from datetime import datetime
import smtplib

def mail_data(data):
    print(data)
    url = f"https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode={data['pincode']}&date={datetime.today().strftime('%d-%m-%Y')}"
    response = requests.get(url)
    response = response.json()
    to_mail = list()
    print(response)
    for center in response['centers']:
        for session in center['sessions']:
            if(session['available_capacity'] > 0):
                if(data['filters']['Age 18+']):
                    if(session['min_age_limit']!=18):
                        continue
                if(data['filters']['Age 45+']):
                    if(session['min_age_limit']!=45):
                        continue
                if(data['filters']['Covishield']):
                    if(session['vaccine'].lower() != 'covishield'):
                        continue
                if(data['filters']['Covaxin']):
                    if(session['vaccine'].lower() != 'covaxin'):
                        continue
                if(data['filters']['Sputnik V']):
                    if(session['vaccine'].lower() != 'sputnik v'):
                        continue
                if(data['filters']['Free']):
                    if(center['fee_type'] != 'Free'):
                        continue
                if(data['filters']['Paid']):
                    if(center['fee_type'] == 'Free'):
                        continue
                useful_data = dict()
                useful_data['name'] = center['name']
                useful_data['address'] = center['address']
                useful_data['from'] = center['from']
                useful_data['to'] = center['to']
                useful_data['fee'] = center['fee_type']
                useful_data['age'] = session['min_age_limit']
                useful_data['vaccine'] = session['vaccine']
                useful_data['available_capacity_dose1'] = session['available_capacity_dose1']
                useful_data['available_capacity_dose2'] = session['available_capacity_dose2']
                to_mail.append(useful_data)
    
    with smtplib.SMTP('smtp.gmail.com',587) as stmp:
        stmp.starttls()
        stmp.login('sender-email', 'sender-password')
        if(len(to_mail)!= 0):
            subject = f"Centers Available for vaccine booking!!!"
            content = ""
            for center in to_mail:
                content+= f"Center name: {center['name']}\nAddress: {center['address']}\n Slots avaible from {center['from']} to {center['to']}\nFee: {center['fee']}\nAge Group: {center['age']}+\nVaccine available: {center['vaccine']}\nDose 1 slots: {center['available_capacity_dose1']}\nDose 2 slots: {center['available_capacity_dose2']}\n\n"
            msg = 'Subject: {}\n\n{}'.format(subject, content)
        else:
            subject = f"No Centers Available for vaccine booking :("
            msg = 'Subject: {}\n\n{}'.format(subject, "We'll send you mail periodically though to make sure you dont miss your chance :)")
        stmp.sendmail('sender-email', data['email'], msg)

