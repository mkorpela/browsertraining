*** Settings ***
Library   Browser

*** Test Cases ***
Browser, Context, Page
    New Browser  webkit  headless=False
    ${mobile}=  Get Device  iPhone SE
    New Context  &{mobile}
    New Page  https://robot-work.shop/
    Take Screenshot
    New Page  https://robotframework.org/
    Take Screenshot
    New Context
    New Page  https://robotframework.org/
    Take Screenshot

Page opens context and browser if none exists
    [Setup]  Close Browser  ALL
    New Page  https://robot-work.shop/
    Get Title  ==  World Wide Workshop Wednesday 2020
    Take Screenshot

Open Browser is for development only
    Open Browser  https://robot-work.shop/
    Get Title  ==  World Wide Workshop Tuesday 2020
    Go To   https://robotframework.org/
    Get Url  !=  https://robot-work.shop/
