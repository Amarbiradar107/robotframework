*** Settings ***
Documentation    validate log in feature
Library    SeleniumLibrary
Test Setup    open browser
Test Teardown    Close Browser
Resource    resource.robot
Test Template    Negative username test


*** Variables ***
${username_field}=    Xpath=//input[@id='username']
${password_field}=    Xpath=//input[@id='password']
${submit_button}=     Xpath=//button[@id='submit']
${success_message}=   Xpath=//strong[contains(text(),'Congratulations student. You successfully logged i')]
${logout_button}=     Xpath=//a[normalize-space()='Log out']
${username_error_message}=    xpath=//div[@id='error']



*** Test Cases ***    username    password
invalid details         student123     Password123
invalid username      abcd        Password123
invalid passowrd      student     12123123

*** Keywords ***
validate login successful
    Enter user_name and password details and submit    ${user_name}    ${password}
    Verify new page URL contains practicetestautomation.com/logged-in-successfully/
    Verify new page contains expected text ('Congratulations' or 'successfully logged in')
    Verify button Log out is displayed on the new page

Negative username test
    [Arguments]    ${user_name}    ${password}
    Enter user_name and password details and submit    ${user_name}    ${password}
    Verify error message is displayed
    Verify error message text is Your username is invalid!

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

Verify error message is displayed
    Element Should Be Visible    ${username_error_message}

Verify error message text is Your username is invalid!
    Element Text Should Be    ${username_error_message}    Your username is invalid!
    


