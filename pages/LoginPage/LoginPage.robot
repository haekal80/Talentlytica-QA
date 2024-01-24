*** Settings ***
Library     SeleniumLibrary
Resource    ../../driver/config.robot
Resource    ../../steps/HomeSteps/HomeStep.robot

*** Variables ***
${Username_Field}        //input[@id='email']
${Password_Field}        //input[@id='password']
${Login_Button}          //input[@type='submit' and @value='Login']
${Login_Success}         //*[contains(text(),'Selamat datang')]
${Href_Lanjutkan}        //a[contains(@href, 'kompas')]

*** Keywords ***
Login Page Kompas Opened
    Move To Login Page
    Wait Until Element Is Visible    ${LOGIN_BUTTON}
    Element Should Be Visible        ${LOGIN_BUTTON}
    Capture Page Screenshot          EMBED

Input Email Field
    Input Text                       ${USERNAME_FIELD}    ${EMAIL}
    Capture Page Screenshot          EMBED

Input Password Field
    Input Text                       ${PASSWORD_FIELD}    ${PASS}
    Capture Page Screenshot          EMBED

Click Login Button Kompas
    Click Element                    ${LOGIN_BUTTON}
    Sleep    5s    

Verify Login Success
    Wait Until Element Is Visible    ${Login_Success}
    Element Should Be Visible        ${Login_Success}
    Capture Page Screenshot    EMBED

Click Lanjutkan
    Click Element    ${Href_Lanjutkan}