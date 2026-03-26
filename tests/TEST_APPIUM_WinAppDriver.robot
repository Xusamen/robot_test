*** Settings ***
Library           AppiumLibrary

*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723
${APP_BAT}        C:\\Users\\recette_windows\\Desktop\\TEST_RECETTE_AUTOM\\script_2.bat

*** Test Cases ***
Scenario Connexion Reussie
    [Setup]    Lancer Application
    
    # Saisie du login via le Name (vu dans Inspect.exe)
    Saisir Texte JavaFX    name=Nom d'utilisateur    Dev
    
    # Saisie du mot de passe
    Saisir Texte JavaFX    name=Mot de passe    souris
    
    # Clic sur le bouton de connexion
    Click Element    name=Connexion
    
    # Vérification
    Wait Until Page Contains    DAFRA AUTO ECOLE    timeout=10s
    
    [Teardown]    Close Application

*** Keywords ***
Lancer Application
    Open Application    ${REMOTE_URL}
    ...    platformName=Windows
    ...    deviceName=WindowsPC
    ...    app=${APP_BAT}
    ...    ms:waitForAppLaunch=15

Saisir Texte JavaFX
    [Arguments]    ${locator}    ${texte}
    # Technique robuste pour JavaFX : Clic + Envoi de touches clavier
    Wait Until Page Contains Element    ${locator}    timeout=10s
    Click Element    ${locator}
    Press Keys       None    ${texte}
    # Press Keys None ENTER  # Optionnel : simuler Entrée après la saisie