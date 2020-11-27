*** Settings ***
Library  Browser
Suite Setup  New Browser  headless=False

*** Test Cases ***
Targeting web UI
   New Page   https://robotframework.org
   Get Title   ==   Robot Framework
   Click    "External"
   Click    "Browser Library"
   Switch Page    NEW
   Get Url  ==  https://github.com/MarketSquare/robotframework-browser

Targeting web app internals
   New Page   https://robotframework.org
   ${title}=  Execute JavaScript    document.title.replaceAll("o", "ö")
   Should Be Equal    ${title}  Röböt Framewörk

Targeting requests
   New Page   https://github.com/MarketSquare/robotframework-browser
   ${mkorpela}=  Http    https://api.github.com/users/mkorpela/orgs
   Should Be Equal    ${mkorpela}[body][0][login]  robotframework