*** Settings ***
Documentation    tabel testing
Library    SeleniumLibrary
Library    Collections
Resource    resource.robot
Resource    pages/table_page.robot
Test Setup     open table browser
Test Teardown    Close Browser

*** Test Cases ***
Language filter Java
    Select Language = Java
    Verify only Java courses are visible
Level filter → Beginner only
    Uncheck Intermediate and Advanced
    Verify that only Beginner courses are visible
Min enrollments → 10,000+
    Open “Min enrollments” dropdown and choose 10,000+
    Verify every visible row shows enrollments ≥ 10,000
