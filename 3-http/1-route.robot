*** Settings ***
Library  Browser

*** Test Cases ***
Intercepting responses
    New Page  https://graphhopper.com/maps
    Type Text    id=0_Input  Turku
    Type Text    id=1_Input  Tampere
    ${promise}=   Promise To    Wait For Response   /api/1//route.*
    Click   id=searchButton
    ${response}=  Wait For   ${promise}
    Log Many   &{response}[request]
    ${same_request}=   Http  ${response}[request][headers][:path]
    Log Many   &{same_request}