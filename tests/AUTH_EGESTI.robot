*** Settings ***
Library    OperatingSystem
Library    WinAutoLibrary
Library     Screenshot

*** Test Cases ***
Test Login Application
    [Teardown]    Run Keyword If Test Failed    Take Screenshot
    Run    C:\\EXECUTION_EGESTI.bat
    Wait Until Keyword Succeeds    10s    1s    Control Should Exist    Connexion
    Page Should Contain    Bienvenue !