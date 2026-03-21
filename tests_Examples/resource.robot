*** Settings ***
Documentation    resource file
Library    SeleniumLibrary

*** Variables ***
${url}=    https://practicetestautomation.com/practice-test-login/
${url_2}=    https://practicetestautomation.com/practice-test-table/
${user_name}=    student
${password}=    Password123
${incorrect_username}=    incorrectUser
${incorrect_password}=     incorrectPassword


*** Keywords ***
open browser
    Create Webdriver    Chrome
    Go To         ${url}
open table browser
    Create Webdriver    Chrome
    Go To         ${url_2}