*** Settings ***
Library       DateTime
Library       String
Resource      ../utils/CollectionList.robot    
Resource      ../pages/ADMSPages/StokPage/ElementProperty/StockElement.robot
Resource      JSExecutor.robot

*** Variables ***
${ColAtt2}
${ColAMS2} 
${ColMethodAUC}
${pattern}        %M%S
${date}           %d-%m-%Y


*** Keywords ***
RandomizerID
    [Arguments]        ${value}    ${fieldname}
    ${patternformat}    Get Current Date    result_format=${pattern}
    ${datedata}    Get Current Date    result_format=${date}
    ${list} =    Contains List Field Entity Primary ADMS Stock
    ${is_in_list} =    Run Keyword And Return Status    Should Contain    ${list}    ${fieldname}
    ${listwords} =   Generate Random String   3    [UPPER]
    ${newstring} =    IF    ${is_in_list}
    ...    Item Identity Dictionary    ${value}    ${patternformat}    ${listwords}
    ...    ELSE IF    '${value}' == 'TANGGAL'
    ...    Store Attribute    ${datedata}    ${fieldname}
    ...    ELSE
    ...    Set Variable    ${value}
    Log To Console    String Field After Inserted : ${newstring}
    [Return]    ${newstring}

Create Schedule
    [Arguments]        ${object}
    ${valuescabang}    Get From Dictionary    ${ColAMS2}         cabang
    Log To Console    Dictionary : ${valuescabang}
    Log               Dictionary : ${valuescabang}
    ${valuestimeauc}    Get From Dictionary    ${ColAtt2}         TimeAuction
    Log To Console    Dictionary : ${valuestimeauc}
    Log               Dictionary : ${valuestimeauc}
    ${valuesmethodauc}    Get From Dictionary    ${ColMethodAUC}    methodauc
    Log To Console    Dictionary : ${valuesmethodauc}
    Log               Dictionary : ${valuesmethodauc}
    ${parts}    Split String    ${valuesmethodauc}    separator=
    ${part1}    Set Variable    ${parts}[0]
    ${objectname}    Set Variable    ${valuestimeauc} WIB | ${valuescabang} (${part1})
    [Return]    ${objectname}

Multiparts String Schedule
    [Arguments]

# Storing JS Attribute #
Store Attribute
    [Arguments]         ${datedata}         ${fieldname}
    ${xpath} =    Field Text Selected       ${fieldname}
    ${element_id} =    SeleniumLibrary.Get Element Attribute    ${xpath}    id
    ${delAtt} =    Set Variable    readonly
    Remove Attribute    ${delAtt}    ${element_id}
    [Return]    ${datedata}

Item Identity Dictionary
    [Arguments]        ${value}    ${patternformat}    ${listwords}
    ${ItemID} =    Set Variable    ${value}${patternformat}${listwords}
    ${Coll}    Create Dictionary    item=${ItemID}
    Set Global Variable    ${Coll}
    [Return]           ${ItemID}
    