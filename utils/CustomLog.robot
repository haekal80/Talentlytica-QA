*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Log Error Confirmation
    [Arguments]    ${xpath}    ${element}
    Log To Console    Element : ${xpath} is ${element}, Not Found !!!
    Fatal Error       Execution stopped due to condition failure.
    Capture Page Screenshot    EMBED  

Log Found Confirmation
    [Arguments]    ${xpath}    ${element}
    Log To Console    Element : ${xpath} is {element}, Found
    Capture Page Screenshot    EMBED  