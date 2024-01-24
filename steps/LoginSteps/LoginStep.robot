*** Settings ***
Resource    ../../pages/LoginPage/LoginPage.robot
Resource    ../HomeSteps/HomeStep.robot

*** Keywords ***
Input Username and Password Kompas
    Input Email Field
    Input Password Field
    Click Login Button Kompas

Verify Login Success
    Verify Login Success
    Click Lanjutkan