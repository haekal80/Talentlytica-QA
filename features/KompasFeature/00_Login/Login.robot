*** Settings ***
Resource    ../../../pages/LoginPage/LoginPage.robot
Resource    ../../../steps/LoginSteps/LoginStep.robot
Resource    ../../../pages/HomePage/HomePage.robot

*** Keywords ***
Login with Valid Credentials Kompas
    GIVEN Login Page Kompas Opened
    WHEN Input Username and Password Kompas
    THEN Home Page Kompas Opened