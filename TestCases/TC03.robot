*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${browser}    chrome
${url}        https://www.demoblaze.com/
*** Test Cases ***
VerifyUrlAndTitle
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    ${current_url}    Get Location
    ${Page_Title}    Get Title
    Log To Console    URL:${current_url}
    Log To Console    Title:${Page_Title}
    Set Test Message    URL:${current_url}/Title:${Page_Title}
#    Sleep    30 seconds
    Close Browser

*** Keywords ***
