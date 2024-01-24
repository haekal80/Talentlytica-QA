*** Settings ***
Resource    ../../pages/LoginPage/LoginPage.robot
Resource    ../../pages/HomePage/HomePage.robot

*** Keywords ***
Open Home Page Kompas
    Go To                            ${URL_KOMPAS}
    Home Page Kompas Opened

Searching News "${Berita}"
    Input Search Field    ${Berita}
    Press Keys Enter
    Sleep    2s
    Wait Until Page Contains    ${Berita}

Select List News Ke- "${Urutan}"
    Select List News    ${Urutan}

Move To Login Page
    Click Login Icon
    Click Login Link