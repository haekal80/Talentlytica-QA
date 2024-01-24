*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Keywords ***
Contains List Dropdown ADMS Stock
    ${list}    Create List    TRANSMISI    PENGGERAK    BAHAN BAKAR    KONDISI    GARANSI    DUS
    [Return]    ${list}

Contains List Dropdown Special ADMS Stock
    ${list}    Create List     BPKB    Invoice
    [Return]    ${list}

Contains List Field Entity Primary ADMS Stock
    ${list}    Create List    NO POLISI    SERIAL NUMBER
    [Return]    ${list}

Contains List Field AMS Timed Schedule
    ${list}    Create List    Hari    Jam    Menit
    [Return]    ${list}

Contains List Field AMS Method Schedule
    ${list}    Create List    Live Auction    Timed Auction
    [Return]    ${list}