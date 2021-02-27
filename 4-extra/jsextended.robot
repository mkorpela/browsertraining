*** Settings ***
Library   Browser  jsextension=${CURDIR}/extension.js  enable_presenter_mode=True

*** Test Cases ***
Example Test
   Open Browser  https://www.reaktor.com
   registerMySelector
   Click  myselector=Work
   Take Screenshot
   serverErrors
   Click  myselector=About
