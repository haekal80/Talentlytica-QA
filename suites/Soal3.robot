*** Settings ***
Resource        ../driver/resources.robot
Resource        ../features/KompasFeature/00_Login/Login.robot
Resource        ../features/KompasFeature/01_SearchNews/SearchNews.robot

Test Setup       Open Browser Using Chrome Browser
Test Teardown    Close Page Browser

*** Test Cases ***
01 LOGIN AND CLICK NEWS IN 2nd PLACE
    Open Home Page Kompas
    Login with Valid Credentials Kompas
    Searching and Click News In 2nd Place