*** Settings ***
Library   Browser  retry_assertions_for=1s

*** Test Cases ***
Basic get without an assertion
    Init route search
    ${url}=  Get Url
    Should Contain    ${url}    point=Helsinki&point=Oulu

Basic get with WUKS assertion
    Init route search
    Wait Until Keyword Succeeds    1s    0.1s    Url should be expected

Get with an assertion and then
    Init route search
    Get Url  contains    point=Helsinki&point=Oulu
    ${service_name}=  Get Title  then  value.split()[0]
    Log To Console    ${service_name}

*** Keywords ***
Init route search
   New Page  https://graphhopper.com/maps
   Type Text    id=0_Input  Helsinki
   Type Text    id=1_Input  Oulu
   Click   id=searchButton

Url should be expected
   ${url}=  Get Url
   Should Contain    ${url}    point=Helsinki&point=Oulu