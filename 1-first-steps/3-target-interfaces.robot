*** Settings ***
Library  Browser
Suite Setup  New Browser  headless=False

*** Test Cases ***
Targeting web UI
   [Documentation]  Web käyttöliittymän automatisointi on erittäin tärkeässä osassa
   New Page   https://robotframework.org
   Get Title   ==   Robot Framework
   Click    "External"
   Click    "Browser Library"
   Switch Page    NEW
   Get Url  ==  https://github.com/MarketSquare/robotframework-browser

Targeting web app internals
   [Documentation]  Web sovellusta voidaan myös käsitellä käyttöliittymän "alta"
   New Page   https://robotframework.org
   ${title}=  Execute JavaScript    document.title.replaceAll("o", "ö")
   Should Be Equal    ${title}  Röböt Framewörk

Targeting requests
   [Documentation]  Browser -kirjastolla voidaan automatisoida
   ...              palvelimen sekä selaimen välistä rajapintaan
   New Page   https://github.com/MarketSquare/robotframework-browser
   ${mkorpela}=  Http    https://api.github.com/users/mkorpela/orgs
   Should Be Equal    ${mkorpela}[body][0][login]  robotframework