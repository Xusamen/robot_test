*** Settings ***
Library    PywinautoLibrary
Library    Screenshot

*** Test Cases ***
Test Login Application
    [Teardown]    Run Keyword If Test Failed    Take Screenshot
    Start Application    C:\\Users\\recette_windows\\Desktop\\TEST_RECETTE_AUTOM\\start.bat
    Sleep    2s
