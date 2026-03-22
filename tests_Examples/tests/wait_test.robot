*** Settings ***
Documentation    test for wait scenario
Library    SeleniumLibrary
*** Test Cases ***
verify wait element
    Open page
    Click Add button
    Wait for 3 seconds for the second input field to be displayed
    click edit and add data
    verify data added

*** Keywords ***
Open page
    Create Webdriver    Chrome
    Go To    https://practicetestautomation.com/practice-test-exceptions/
Click Add button
    Click Button    xpath=//button[@id='add_btn']
Wait for 3 seconds for the second input field to be displayed
    Wait Until Element Is Visible    xpath=//div[@id='row2']/input[@type='text']    timeout=10s
click edit and add data
#    Click Button    xpath=//div[@id='row2']//button[@id='edit_btn']
    Input Text      xpath=//div[@id='row2']/input[@type='text']     abcd
    Click Button    xpath=//div[@id='row2']//button[@id='save_btn']

verify data added
    ${result}=     Get Text    xpath=//div[@id='confirmation']
    Should Be Equal As Strings    ${result}    Row 2 was saved