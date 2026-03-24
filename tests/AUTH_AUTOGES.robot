*** Settings ***
Library    WinAutoLibrary
Library     Screenshot

*** Test Cases ***
Test Login Application
    [Teardown]    Run Keyword If Test Failed    Take Screenshot
    Launch Application    C:\\Users\\recette_windows\\Desktop\\TEST_RECETTE_AUTOM\\start.bat
    Wait Until Keyword Succeeds    10s    1s    Control Should Exist    Connexion
    Input Text    Nom d'utilisateur    Dev
    Input Text    Mot de passe    souris
    Click Button    Connexion
    Page Should Contain    DAFRA AUTO ECOLE