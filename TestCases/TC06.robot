*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${browser}    chrome
${url}        https://www.selenium.dev/
${expected_title}    Selenium
*** Test Cases ***
VerifyUrl
    LoginToBrowser
    ${current_url}    Get Location
    Log To Console    URL:${current_url}
    Should Contain    ${current_url}    selenium.dev

    Set Test Message    URL:${current_url}
VerifyTitle
    LoginToBrowser
    ${page_title}    Get Title
    Log To Console    Title:${page_title}
    Should be Equal    ${page_title}    ${expected_title}
    Set Test Message    Title:${page_title}
    Close Browser
*** Keywords ***
LoginToBrowser
    Open Browser   ${url}    ${browser}
    Maximize Browser Window