*** Settings ***
Resource    ../../../pages/LoginPage/LoginPage.robot
Resource    ../../../steps/LoginSteps/LoginStep.robot
Resource    ../../../pages/HomePage/HomePage.robot
Resource    ../../../steps/HomeSteps/HomeStep.robot

*** Keywords ***
Searching and Click News In 2nd Place
    GIVEN Home Page Kompas Opened
    WHEN Searching News "PRESIDEN"
    AND Select List News Ke- "2"
    Then Verify News Is Opened