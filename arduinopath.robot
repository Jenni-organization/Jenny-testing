*** Settings ***
Documentation           path to Arduino
Library    SeleniumLibrary
Library    Collections
Test Setup       open the browser with the url
Test Teardown    Close Browser

*** Variables ***


*** Test Cases ***
Validte path 1
    login by the first path
Validte path 2
    login by the second path
Validte path 3
    login by the third path
Validte path 4
    login by the fourth path


*** Keywords ***
open the browser with the url
    Create Webdriver    Chrome  executable_path=C:\Users\DHR 1\Documents\chromedriver
    Go To               http://192.168.31.31/

login by the first path
    Click Element       //span[contains(text(),'carte et developpement')]
    Click Element       link=Arduino
    Sleep    3


login by the second path

    Mouse Down    //span[contains(text(),'Categories')]
    Click Element    link=Cartes de developpement
    Click Element       link=Arduino
    Sleep    3

login by the third path
    Mouse Down    //span[contains(text(),'Categories')]
    Mouse Down    link=Cartes de developpement
    Click Element    link=Arduino
    Sleep    3

login by the fourth path
    Input Text      id:woocommerce-product-search-field-0      Arduino
    Sleep       3
    Click Element   css:.icon-search
    Sleep    3

