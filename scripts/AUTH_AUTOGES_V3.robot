*** Settings ***
Library    Process
Library    PywinautoLibrary

*** Test Cases ***
Test Lancement et Connexion Application JavaFX
    [Teardown]    Terminate All Processes
    Launch Application  AUTO-ECOLE-SCHEDULER.exe 
    Sleep    5s   
    # Connecter Pywinauto à l'application
    Connect To Application    backend=uia    title_regex=.*DAFRA AUTO-ECOLE SCHEDULER.*
    
    # Récupérer la fenêtre principale
    ${dlg}=    Get Dialog From Regex    .*DAFRA AUTO-ECOLE SCHEDULER.*
    
    # D'abord, inspecter les contrôles disponibles
    Print Control Identifiers
    Set Editbox Text    name=Poste    Dev
    Set Editbox Text    name=Mot de passe    souris
    Click    ${dlg}.Connexion
    #Send Keys    Dev{TAB}souris
    
    #Click    ${dlg}.LISTES

    Sleep    2s
    Log    Connexion effectuée