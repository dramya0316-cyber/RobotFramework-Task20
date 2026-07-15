*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${browser}    chrome
${url}         https://demowebshop.tricentis.com/

*** Test Cases ***
LoginTest
    Open Browser   ${url}    ${browser}
    Maximize Browser Window
    LoginToApplication
    Close Browser

*** Keywords ***
LoginToApplication
    Click Link    Xpath://a[normalize-space()='Log in']
    Input Text    id:Email    dramya0316@gmail.com
    Input Text    id:Password    Ramya@1998
    Click Element    Xpath://input[@value='Log in']
    Sleep    1 minutes
