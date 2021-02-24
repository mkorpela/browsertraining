*** Settings ***
Library   Browser

*** Test Cases ***
Browser, Context, Page
    New Browser  webkit  headless=False
    ${mobile}=  Get Device  iPhone SE
    New Context  &{mobile}
    New Page  https://robocon.io/
    Take Screenshot
    New Page  https://robotframework.org/
    Take Screenshot
    New Context
    New Page  https://robotframework.org/
    Take Screenshot

Page opens context and browser if none exists
    [Setup]  Close Browser  ALL
    New Page  https://robocon.io/
    Get Title  ==  RoboCon 2021
    Take Screenshot

Open Browser is for development only
    Open Browser  https://robocon.io/
    Get Title  ==  RoboCon 2021
    Go To   https://robotframework.org/
    Get Url  !=  https://robocon.io/
