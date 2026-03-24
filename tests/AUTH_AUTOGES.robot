*** Settings ***
Library    PywinautoLibrary
Library    Screenshot

*** Test Cases ***
Test Login Application
    [Teardown]    Run Keyword If Test Failed    Take Screenshot
    Start Application    C:\\Users\\recette_windows\\Desktop\\TEST_RECETTE_AUTOM\\start.bat
    Connect To Application    title=Connexion
    Type Into    Nom d'utilisateur    Dev
    Type Into    Mot de passe    souris
    Click Element    Connexion
    Window Should Exist    DAFRA AUTO ECOLE