*** Settings ***
Documentation    tabel testing
Library    SeleniumLibrary
Library    Collections
Resource    resource.robot
Test Setup     open table browser
Test Teardown    Close Browser

*** Variables ***

${any_radio_button}=    xpath=//input[@value='Any']
${Java_radio_button}=    Java
${Python_radio_button}=    xpath=//input[@value='Python']
${Beginner_checkbox}=    xpath=//input[@value='Beginner']
${Intermediate_checkbox}=    xpath=//input[@value='Intermediate']
${Advanced_checkbox}=    xpath=//input[@value='Advanced']
${Enrollments_dropdown}=    xpath=//div[@role='button']
${tabel_header}=            xpath=//table/thead/tr/th


*** Test Cases ***
Language filter Java
    Select Language = Java
    Verify only Java courses are visible
*** Keywords ***
Select Language = Java
    Select Radio Button    lang    Java
Verify only Java courses are visible
    ${Language}=     Set Variable    Language
    ${headers}=    Get Webelements    ${tabel_header}
    ${index}=    Set Variable    1
    FOR    ${data}    IN    @{headers}
        log     ${data.text}
        Exit For Loop If    '${data.text}'=='${Language}'
            ${index}=     Evaluate    ${index}+1
    END
    ${rows}=    Get Webelements     //table/tbody/tr/td[${index}]

    FOR    ${element}    IN   @{rows}
            Log    ${element.text}
            Exit For Loop If    '${element.text}' == ''
            Element Text Should Be    ${element}    Java    ignore_case=True
    END








    

    