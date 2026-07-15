*** Settings ***
Library    SeleniumLibrary
*** Variables ***

*** Test Cases ***
LoginTest
    OpenBrowser    https://demowebshop.tricentis.com/
    Maximize Browser Window
    LoginToApplication
    Sleep 30 seconds
    Close Browser
    
*** Keywords ***
LoginToApplication
    Click Link    Xpath://a[normalize-space()='Log in']
    Input Text    id:Email    dramya0316@gmail.com
    Input Text    id:Password    Ramya@1998
    Click Element    Xpath://input[@Value}='Log in']