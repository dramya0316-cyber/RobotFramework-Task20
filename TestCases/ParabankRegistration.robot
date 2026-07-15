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
VerifySuccessfulRegistration
    LoginToBrowser
    RegistrationFields
    Sleep    10 s
    Page Should Contain    Your account was created successfully
    Set Test Message    Successful Registration
    Close Browser
    

#VerifyLoginWithValidCredentials
#    LoginToBrowser
#
#    Input Text    name=username    Ramya1603
#    Input Password    name=password    Ramya@160398
#
#    Click Button    xpath=//input[@value='Log In']
#
#    Page Should Contain    Accounts Overview
#    Set Test Message    Valid login Successful
#
#    Close Browser
#
#VerifyLoginWithInvalidCredentials
#    LoginToBrowser
#    Input Text    name=username    Ramya1654
#    Input Password    name=password    Ramya@160398
#
#    Click Button    xpath=//input[@value='Log In']
#    Page Should Contain    The username and password could not be verified
#    Set Test Message    Invalid login Verified
#    Close Browser
*** Keywords ***
LoginToBrowser
      Open Browser    ${URL}    ${BROWSER}
      Maximize Browser Window
RegistrationFields
    Input Text    id:customer.firstName    Ramya
    Input Text    id:customer.lastName    D 
    Input Text    id:customer.address.street    Chennai
    Input Text    id:customer.address.city   Chennai
    Input Text    Xpath://input[@id='customer.address.state']    Tamil Nadu
    Input Text    Xpath://input[@id='customer.address.zipCode']    600012
    Input Text    Xpath://input[@id='customer.phoneNumber']    9618777825
    Input Text    id:customer.ssn   12345
    Input Text    Xpath://input[@id='customer.username']    Ramya160398
    Input Text    Xpath://input[@id='customer.password']    Ramya@160398
    Input Text    Xpath://input[@id='repeatedPassword']    Ramya@160398

    Click Element    xpath=//input[@value='Register']
