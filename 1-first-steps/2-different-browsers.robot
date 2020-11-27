*** Settings ***
Library  Browser

*** Test Cases ***
Chromium
    [Documentation]  Chromium -pohjaisia selaimia ovat muunmuassa Google Chrome, Microsoft Edge ja Opera.
    New Browser  chromium  headless=False
    New Page  https://robotframework.org
    Sleep  3s

Webkit
    [Documentation]  Applen Safari on Webkit -pohjainen selain.
    New Browser  webkit  headless=False
    New Page  https://robotframework.org
    Sleep  3s

Firefox
    [Documentation]  Firefox -pohjaisia selaimia ovat muunmuassa Mozilla Firefox ja Tor Browser.
    New Browser  firefox  headless=False
    New Page  https://robotframework.org
    Sleep  3s