*** Settings ***
Library     SeleniumLibrary
Library    String
Resource    ../../driver/config.robot

*** Variables ***
${Login_Icon}      //*[@id='sso__icon__login_top']
${Kompas_Logo}     //div[@class='logo']/child::a[@href='https://www.kompas.com']
${Login_Link}      //a[@id='txt_signin']
${Search_Field}    //input[@id='search']
${Search_Icon}     //button[@type='button' and @class='form__button__clear']

*** Keywords ***    
Home Page Kompas Opened
    Wait Until Element Is Visible    ${Kompas_Logo}
    Element Should Be Visible        ${Kompas_Logo}
    Sleep    2s
    Capture Page Screenshot    EMBED

Click Login Icon
    Wait Until Element Is Visible    ${LoginIcon}
    Element Should Be Visible        ${LoginIcon}
    Click Element                    ${LoginIcon}
    Sleep    2s
    Capture Page Screenshot    EMBED

Click Login Link
    Wait Until Element Is Visible    ${Login_Link}
    Element Should Be Visible        ${Login_Link}
    Click Element                    ${Login_Link}
    Sleep    2s
    Capture Page Screenshot    EMBED

Input Search Field
    [Arguments]    ${Berita}
    Input Text    ${Search_Field}    ${Berita}
    Capture Page Screenshot    EMBED

Press Keys Enter
    Press Keys    ${Search_Field}    ENTER

Verify Search Success
    [Arguments]    ${Title}
    Convert To Upper Case    ${Title}
    ${xpath} =    Set Variable    //div[@class='title__content' and contains(text(),'${Title}')]    
    Wait Until Element Is Visible    ${xpath}
    Capture Page Screenshot    EMBED

Select List News
    [Arguments]    ${Urutan}
    ${xpath} =       Set Variable    //div[@class='gsc-webResult gsc-result' and position()=${Urutan}]   
    ${Text}=    Get Text        ${xpath}/descendant::a[@class='gs-title']
    ${Href}=     Get Element Attribute   ${xpath}/descendant::a[@class='gs-title']    href
    Set Suite Variable    ${Href_News}    ${Href}
    Click Element    ${xpath}/descendant::a[@class='gs-title']
    Capture Page Screenshot    EMBED

Verify News Is Opened
    Sleep    3s
    Wait Until Location Is    ${Href_News}
    ${url}    Get Location
    Should Be Equal    ${url}    ${Href_News}
    Capture Page Screenshot    EMBED