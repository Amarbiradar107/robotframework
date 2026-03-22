*** Settings ***
Documentation    resource file
Library    SeleniumLibrary

*** Variables ***
${url}=    https://practicetestautomation.com/practice-test-table/

*** Test Cases ***
open browser
    Create Webdriver    Chrome
    Go To         ${url}

