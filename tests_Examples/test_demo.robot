*** Settings ***
Documentation    validate log in feature
Library    SeleniumLibrary
Test Setup    open browser
Test Teardown    Close Browser
Resource    resource.robot


*** Variables ***
${username_field}=    Xpath=//input[@id='username']
${password_field}=    Xpath=//input[@id='password']
${submit_button}=     Xpath=//button[@id='submit']
${success_message}=   Xpath=//strong[contains(text(),'Congratulations student. You successfully logged i')]
${logout_button}=     Xpath=//a[normalize-space()='Log out']


*** Test Cases ***
validate login successful
    Enter user_name and password details and submit    ${user_name}    ${password}
    Verify new page URL contains practicetestautomation.com/logged-in-successfully/
    Verify new page contains expected text ('Congratulations' or 'successfully logged in')
    Verify button Log out is displayed on the new page



*** Keywords ***
Enter user_name and password details and submit
    [Arguments]    ${username}    ${password}
    Input Text     ${username_field}    ${user_name}
    Input Password    ${password_field}    ${password}
    Click Button        ${submit_button}

Verify new page URL contains practicetestautomation.com/logged-in-successfully/
    Location Should Contain    https://practicetestautomation.com/logged-in-successfully/

Verify new page contains expected text ('Congratulations' or 'successfully logged in')
    Element Should Contain    ${success_message}    You successfully logged in!

Verify button Log out is displayed on the new page
    Element Text Should Be    ${logout_button}    Log out
    


