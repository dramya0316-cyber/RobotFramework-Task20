*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    Chrome
${url}    https://saucedemo.com
${username}    standard_user
${password}    secret_sauce
${Invalid username}    Ramya123
${Invalid password}    Ramya@123


*** Test Cases ***
1.VerifyLoginWithValidCredentials
    Open Sauce Demo
    Login
    Page Should Contain    Swag Labs
    Set Test Message    Valid login Successful
    Close Browser
2.VerifyLoginWithInValidCredentials
    Open Sauce Demo
    Login Invalid Credentials
    Verify Error Message
    Set Test Message    Invalid login Verified
    Close Browser
3.Verify Product Added To Cart
    Open Sauce Demo
    Login
    Page Should Contain Element    Xpath://div[text()='Sauce Labs Bike Light']
    Add Back Light to cart
    open Cart
    Element Should Be Visible     Xpath://div[text()='Sauce Labs Bike Light']
    Set Test Message    Product added to cart successfully
    Sleep    2s
    Close Browser

4.Verify Checkout Summary with Multiple Products
    Open Sauce Demo
    Login
    Add sauce labs bolt t-shirt
    Add sauce labs onesie
    open Cart
    Verify Products in Cart
    Checkout
    Fill Check Out Details
    Verify Checkout Overview
    Sleep    2s
    Set Test Message    Verified Checkout Summary With Multiple Products
    Close Browser




*** Keywords ***
Open Sauce Demo
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    name:user-name    10s
Login
    Input Text    name=user-name    ${username}
    Input Password    name=password   ${password}

    Click Button    Xpath://input[@value='Login']
    Sleep    2 Seconds
Login Invalid Credentials
    Input Text    name=user-name    ${Invalid username}
    Input Password    name=password   ${Invalid password}

    Click Button    Xpath://input[@value='Login']
    Sleep    2 Seconds

Verify Error Message
    Page Should Contain    Username and password do not match any user in this service
    Page Should Contain Element    Xpath://h3[@data-test="error"]
Add Back Light to cart
    Click Button    Xpath://button[@id='add-to-cart-sauce-labs-bike-light']
open Cart
    Click Element    Xpath://a[@data-test='shopping-cart-link']
Add sauce labs bolt t-shirt
    Click Button    Xpath://button[@id='add-to-cart-sauce-labs-bolt-t-shirt']
Add sauce labs onesie
    Click Button    Xpath://button[@id='add-to-cart-sauce-labs-onesie']
Verify Products in Cart
    Page Should Contain    Sauce Labs Bolt T-Shirt
    Page Should Contain    Sauce Labs Onesie
Checkout
    Click Button    Xpath://button[contains(text(),'Checkout')]
Fill Check Out Details
     Input Text    id:first-name    Ramya
    Input Text    id:last-name    D
    Input Text    id:postal-code    500001
    Click Button    Xpath://input[@Value='Continue']
Verify Checkout Overview
    Element Should Contain    class:title    Checkout: Overview
    Page Should Contain    Sauce Labs Bolt T-Shirt
    Page Should Contain    Sauce Labs Onesie
    Element Should Contain    xpath:(//div[@class='cart_quantity'])[1]    1
    Element Should Contain    xpath:(//div[@class='cart_quantity'])[2]    1