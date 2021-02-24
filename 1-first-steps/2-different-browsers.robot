*** Settings ***
Library  Browser  enable_presenter_mode=True

*** Test Cases ***
Chromium
    [Documentation]  Chromium -pohjaisia selaimia ovat muunmuassa Google Chrome, Microsoft Edge ja Opera.
    New Browser  chromium  headless=False
    New Page  https://robotframework.org

Webkit
    [Documentation]  Applen Safari on Webkit -pohjainen selain.
    New Browser  webkit  headless=False
    New Page  https://robotframework.org

Firefox
    [Documentation]  Firefox -pohjaisia selaimia ovat muunmuassa Mozilla Firefox ja Tor Browser.
    New Browser  firefox  headless=False
    New Page  https://robotframework.org
