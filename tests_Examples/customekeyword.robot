*** Settings ***
Library    customliberary/Customkeyword.py

*** Test Cases ***
Print Hello world
    print hello world

*** Keywords ***
print Hello world
    Log    Hello World