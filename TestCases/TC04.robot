*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Test Cases ***
PrintTestMessage
    Log To Console    This prints Message in Console
    Set Test Message    This prints in the report
*** Keywords ***