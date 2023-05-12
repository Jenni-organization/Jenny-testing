*** Settings ***
Documentation           login to transformateur
Library    SeleniumLibrary
Library    Collections
Test Teardown    Close Browser

*** Variables ***

*** Test Cases ***
check the product display page
    check if the element are available
*** Keywords ***
check if the element are available
    Create Webdriver    Chrome  executable_path=C:\Users\DHR 1\Documents\chromedriver
    Go To               http://192.168.31.31/
    Click Element       //span[contains(text(),'carte et developpement')]
    Click Element       link=Arduino
    @{element} =     Create List        Arduino BT  Arduino Lilypad     Arduino Mega    ARDUINO Micro   Arduino mini    ARDUINO nano    Arduino Nano    Arduino UNO
    Sleep    6
    ${lists} =       Get Webelements        css:.single-product-link
    @{products}=     Create List
    Log    ${lists}
    FOR     ${lists}     IN  @{lists}
            Append To List    ${products}   ${lists.text}
    END
    log         ${products}
    Lists Should Be Equal        ${products}    ${element}
