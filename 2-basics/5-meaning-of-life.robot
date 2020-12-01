*** Settings ***
Library   Browser

*** Test Cases ***
The Question
   Open Browser  https://www.wolframalpha.com/
   Type Text   input    What is the meaning of life
   Click   form > button
   Get Attribute   text="Result:" >> ../../div/div/img   alt  starts  42\n
   Sleep  5s

