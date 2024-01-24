*** Settings ***
Library    SeleniumLibrary
Resource   CustomLog.robot

*** Keywords ***
Click Element with Implicit Wait
    [Arguments]                       ${xpath}            ${element}
    Log Found Confirmation            ${xpath}            ${element}
    Set Browser Implicit Wait         2 seconds
    Click Element                     ${xpath}
    Capture Page Screenshot           EMBED  

Input Element with Implicit Wait
    [Arguments]                       ${xpath}            ${element}          ${ValFile}
    Log Found Confirmation            ${xpath}    ${element}
    Set Browser Implicit Wait         2 seconds
    Input Text                        ${xpath}    ${ValFile}
    Capture Page Screenshot           EMBED
 
    