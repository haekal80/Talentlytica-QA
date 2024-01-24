*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Remove Attribute
    [Arguments]                ${attribute}        ${target}
    Execute JavaScript    
    ...    const attrsToRemove = ['${attribute}'];    
    ...    for (const attr of attrsToRemove) {
    ...    document.getElementById('${target}').removeAttribute(attr);
    ...    };

Action Click Parse
    [Arguments]                ${xpath}
    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${xpath}    
    
