*** Settings ***
Library  Browser
Suite Setup   New Context  permissions=['geolocation']  geolocation={'latitude': 59.95, 'longitude': 30.31667}

*** Test Cases ***
Screenshot when not ready
    New Page   https://www.google.com/maps
    Set Geolocation    35.652832    139.839478
    Click   id=widget-mylocation
    Take Screenshot

Screenshot after network is idle
    New Page   https://www.google.com/maps
    Set Geolocation    1.3146631    103.8454093
    Click   id=widget-mylocation
    Wait Until Network Is Idle
    Take Screenshot

Intercepting responses
    New Page  https://graphhopper.com/maps
    Type Text    id=0_Input  Turku
    Type Text    id=1_Input  Tampere
    ${promise1}=   Promise To    Wait For Response   /api/1//geocode.*q=Turku
    ${promise2}=   Promise To    Wait For Response   /api/1//geocode.*q=Tampere
    ${promise3}=   Promise To    Wait For Response   /api/1//route.*
    Click   id=searchButton
    ${responses}=  Wait For   ${promise1}  ${promise2}  ${promise3}
    Log  ${responses}[0][body][hits][0][point]
    Log  ${responses}[1][body][hits][0][point]
    Log  ${responses}[2][body][paths][0][distance]
