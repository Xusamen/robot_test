*** Settings ***
Library    WinAutoLibrary

*** Test Cases ***
Test Login Application
    Launch Application    C:\\app\\monapp.exe
    Wait Until Keyword Succeeds    10s    1s    Control Should Exist    Login
    Input Text    username_field    admin
    Input Text    password_field    password
    Click Button    login_button
    Page Should Contain    Tableau de bord