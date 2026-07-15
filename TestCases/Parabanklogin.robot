*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${browser}    chrome
${url}        https://parabank.parasoft.com/parabank/register.htm
${FirstName}    Ramya
${LastName}    D


#${Success_Registration}    Your account was created successfully
#${Username}    Ramya1603
#${Password}    Ramya@160398

*** Test Cases ***
VerifyLoginWithValidCredentials
    LoginToBrowser

    Input Text    name=username    Ramya1603
    Input Password    name=password    Ramya@160398

    Click Button    xpath=//input[@value='Log In']

    Page Should Contain    Accounts Overview
    Set Test Message    Valid login Successful

    Close Browser

VerifyLoginWithInvalidCredentials
    LoginToBrowser
    Input Text    name=username    Ramya1654
    Input Password    name=password    Ramya@160398

    Click Button    xpath=//input[@value='Log In']
    Page Should Contain    The username and password could not be verified
    Set Test Message    Invalid login Verified
    Close Browser
*** Keywords ***
LoginToBrowser
      Open Browser    ${URL}    ${BROWSER}
      Maximize Browser Window

