*** Settings ***
Documentation        Ensimmäiseksi laitetaan ympäristöt ajokuntoon
               ...   1) `robot --version` -> 3.2.2
               ...   2) `node.js`
               ...   3) `python -m pip install -U robotframework-browser`
               ...   4) `rfbrowser init`
               ...   5) Aja tämä tiedosto komennolla `robot`
Library    Browser

*** Test Cases ***
Opening a browser
    Open Browser  https://robotframework.org    # Vaihda komennoksi `New Page`. Mitä tapahtui?
    Sleep  1s