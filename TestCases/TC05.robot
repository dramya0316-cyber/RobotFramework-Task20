*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${browser}    chrome
${url}        https://www.selenium.dev/
${expected_title}    Selenium
*** Test Cases ***
LoginTest
    Open Browser   ${url}    ${browser}
    Maximize Browser Window
    ${current_url}    Get Location
    ${page_title}    Get Title

    Log To Console    URL:${current_url}
    Log To Console    Title:${page_title}

    Should Contain    ${current_url}    selenium.dev
    Should be Equal    ${page_title}    ${expected_title}

    Set Test Message    URL:${current_url}/ Title:${page_title}
    Close Browser
*** Keywords ***

