*** Settings ***
Documentation    tabel testing
Library    SeleniumLibrary
Library    Collections


*** Variables ***
${any_radio_button}=    xpath=//input[@value='Any']
${Java_radio_button}=    Java
${Python_radio_button}=    xpath=//input[@value='Python']
${Beginner_checkbox}=    xpath=//input[@value='Beginner']
${Intermediate_checkbox}=    xpath=//input[@value='Intermediate']
${Advanced_checkbox}=    xpath=//input[@value='Advanced']
${Enrollments_dropdown}=    xpath=//div[@role='button']
${tabel_header}=            xpath=//table/thead/tr/th

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

Uncheck Intermediate and Advanced
    Unselect Checkbox    ${Intermediate_checkbox}
    Unselect Checkbox    ${Advanced_checkbox}

Verify that only Beginner courses are visible
    ${Level}=     Set Variable    Level
    ${headers}=    Get Webelements    ${tabel_header}
    ${index}=    Set Variable    1
    FOR    ${data}    IN    @{headers}
        log     ${data.text}
        Exit For Loop If    '${data.text}'=='${Level}'
            ${index}=     Evaluate    ${index}+1
    END
    ${rows}=    Get Webelements     //table/tbody/tr/td[${index}]

    FOR    ${element}    IN   @{rows}
            Log    ${element.text}
            Exit For Loop If    '${element.text}' == ''
            Element Text Should Be    ${element}    Beginner    ignore_case=True
    END


Open “Min enrollments” dropdown and choose 10,000+
    Click Element    ${Enrollments_dropdown}
    Log    element clicked
    ${dropdown_values}=    Get Webelements    xpath=//ul/li[@role='option']
    FOR    ${data}    IN    @{dropdown_values}
        IF    '${data.text}'== '10,000+'
                Click Element    ${data}
                Exit For Loop If    '${data.text}'== '10,000+'
        END

    END

Verify every visible row shows enrollments ≥ 10,000
    ${Enrollments}=     Set Variable    Enrollments
    ${headers}=    Get Webelements    ${tabel_header}
    ${index}=    Set Variable    1
    FOR    ${data}    IN    @{headers}
        log     ${data.text}
        Exit For Loop If    '${data.text}'=='${Enrollments}'
            ${index}=     Evaluate    ${index}+1
    END
    ${rows}=    Get Webelements     //table/tbody/tr/td[${index}]

    FOR    ${element}    IN   @{rows}
            Log    ${element.text}
            Exit For Loop If    '${element.text}' == ''
            ${Integer_Enrollments}=     Convert To Integer    ${element.text}
            IF    ${Integer_Enrollments} >= 10000
                log     Enrollments are more than 10000
            ELSE
                Log    Enrollments are less than 10000
            END
    END