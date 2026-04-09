*** Settings ***
Library           SikuliLibrary
Library           Process

*** Variables ***
${BASE_IMG}       C:/Users/DID/Documents/OpenTestFactory/images
${TIMEOUT}        30

*** Keywords ***
Démarrer l'application EGESTI
    [Documentation]    Lance l'application via le fichier .bat
    Start Process    C:\\EXECUTION_EGESTI.bat    shell=True
    Add Image Path   ${BASE_IMG}/Login
    Wait Until Screen Contain    button_se_connecter.png    ${TIMEOUT}

Saisir les identifiants "${username}" et "${password}"
    [Documentation]    Saisie visuelle du login et du mot de passe
    Wait Until Screen Contain    champ_nom_utilisateur.png    10
    Input Text    champ_nom_utilisateur.png    ${username}
    
    # Utilisation de votre astuce pour le mot de passe
    Click         champ_mot_de_passe.png
    Input Text    ${EMPTY}    ${password}

Valider l'authentification
    [Documentation]    Clique sur le bouton de connexion
    Click         button_se_connecter.png