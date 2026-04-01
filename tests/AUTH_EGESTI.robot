*** Settings ***
Documentation     Automatisation de l'authentification EGESTI avec SikuliLibrary.
Library           SikuliLibrary
Library           Process
Suite Setup       Start Sikuli Process
Suite Teardown    Stop Remote Server

*** Variables ***
${IMAGE_PATH}      ${CURDIR}${/}images${/}Login${/}
${TIMEOUT}         30

*** Test Cases ***
AUTH EGESTI
    # Configuration du chemin des images
    Add Image Path    ${IMAGE_PATH}

    Start Process    C:\\EXECUTION_EGESTI.bat    shell=True
    
    Wait Until Screen Contain    button_se_connecter.png    ${TIMEOUT}
    
    Wait Until Screen Contain    champ_nom_utilisateur.png    10
    Input Text    champ_nom_utilisateur.png    admin
    
    Sleep    5s

    Click         champ_mot_de_passe.png
    Input Text    ${EMPTY}    admin
    #Input Text    champ_mot_de_passe.png       admin
    
    Click         button_se_connecter.png