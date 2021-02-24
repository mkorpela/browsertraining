*** Settings ***
Library   Browser  jsextension=${CURDIR}/extension.js

*** Test Cases ***
Example Test
   New Page
   myGoToKeyword   http://www.robotframework.org