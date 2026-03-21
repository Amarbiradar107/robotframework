*** Settings ***
Documentation    resource file
Library    SeleniumLibrary

*** Variables ***
${url}=    https://practicetestautomation.com/practice-test-login/
${user_name}=    student
${password}=    Password123


*** Keywords ***
open browser
    Create Webdriver    Chrome
    Go To         ${url}
 