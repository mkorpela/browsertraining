*** Settings ***
Library  Browser
Suite Setup  Open Browser  https://robot-work.shop
Suite Teardown  Close Browser

*** Test Cases ***
CSS Selector
   Hover  \#sponsors
   Highlight Elements  \#sponsors a   duration=2s
   Sleep  3s

xpath Selector
   Hover  \#sponsors
   Highlight Elements  //*[@id="sponsors"]/div[2]/div/div[2]/div[1]/a  duration=2s  color=red
   Sleep  3s

text Selector
   Hover  \#sponsors
   Highlight Elements  "Main Sponsors"  duration=1s  width=6px  color=gray
   Sleep  2s

id Selector
   Hover  \#sponsors
   Highlight Elements  id=sponsors  duration=2s  style=solid  color=pink
   Sleep  3s

Combining selectors
   Click  id=browserkirjastosuomeksifinlandsuomi3
   ${txt}=   Get Text    id=browserkirjastosuomeksifinlandsuomi3 >> ../../div[2] >> text=/.*Playwright.*/
   Should Be Equal  ${txt}  Katsahdus uuteen Browser kirjastoon, joka käyttää Playwright selainautomaatiotyökalua.
