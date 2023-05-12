*** Settings ***
Documentation           verify Filtre option
Library    SeleniumLibrary
Library    Collections
Library    BuiltIn
Test Setup       open the browser with the url
Test Teardown    Close Browser

*** Variables ***
@{Filtre1} =       ${Fabricant}    ${Nombre de bits}     ${Processeur central}    ${Taille / Dimension}
@{index} =         1      1    1   1
@{Filtre2} =       ${Nombre de bits}     ${Processeur central}
@{Filtre3} =       ${Fabricant}     ${Processeur central}    ${Taille / Dimension}
@{Filtre4} =       ${Fabricant}     ${Processeur central}    ${Taille / Dimension}
@{index4} =         1       3       1
@{Filtre5} =       ${Fabricant}     ${Processeur central}    ${Taille / Dimension}
@{index5} =             1       3       2
@{Filtre6} =       ${Fabricant}     ${Processeur central}
@{index6} =             1       4


${Fabricant} =             //option[contains(text(),'Fabricant')]/parent::select
${Nombre de bits} =          //option[contains(text(),'Nombre de bits')]/parent::select
${Processeur central} =     //option[contains(text(),'Processeur central')]/parent::select
${Taille / Dimension} =       //option[contains(text(),'Taille / Dimension')]/parent::select


${product1} =       link=Arduino Mega
${expected_product1} =      Arduino Mega
${product2} =       link=ARDUINO Micro
${expected_product2} =      ARDUINO Micro
${product3} =       link=Arduino mini
${expected_product3} =      Arduino mini
${product4} =       link=Arduino UNO
${expected_product4} =      Arduino UNO
${product5} =       link=Arduino Nano
${expected_product5} =      Arduino Nano
${product6} =       link=Arduino BT
${expected_product6} =      Arduino BT


*** Test Cases ***
select the specify product 1
    select the product      ${Filtre1}    ${index}
    check the product       ${product1}         ${expected_product1}
select the specify product 2
    select the product      ${Filtre2}    ${index}
    check the product       ${product2}         ${expected_product2}
select the specify product 3
    select the product      ${Filtre3}     ${index}
    check the product        ${product3}         ${expected_product3}
select the specify product 4
    select the product      ${Filtre4}     ${index4}
    check the product        ${product4}         ${expected_product4}
select the specify product 5
    select the product      ${Filtre5}     ${index5}
    check the product        ${product5}         ${expected_product5}
select the specify product 6
    select the product      ${Filtre6}     ${index6}
    check the product        ${product6}         ${expected_product6}

*** Keywords ***
open the browser with the url
    Create Webdriver    Chrome  executable_path=C:\Users\DHR 1\Documents\chromedriver
    Go To               http://192.168.31.31/
    Click Element       //span[contains(text(),'carte et developpement')]
    Click Element       link=Arduino


select the product
    [Arguments]         ${Filtre}   ${index}
    ${j}=   Set Variable    0
    FOR    ${i}    IN  @{Filtre}
         Select From List By Index   ${i}   ${index}[${j}]
         ${j}=  Evaluate    ${j}+1
         Sleep    3

    END
    Click Element       //button[contains(text(),'Filtre')]
    Sleep    3
check the product
    [Arguments]    ${product}           ${expected_product}
    Element Text Should Be       ${product}         ${expected_product}




