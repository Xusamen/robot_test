*** Settings ***
Library    Process
Library    PywinautoLibrary
Library    OperatingSystem

*** Test Cases ***
Test Lancement et Connexion Application JavaFX
    [Teardown]    Terminate All Processes

    # Lancer le .bat
    Run    C:\\EXECUTION_EGESTI.bat    shell=True

    # Se connecter globalement à UIA (sans PID ni titre)
    Connect To Application    backend=uia

    # Attendre que la fenêtre contenant "Bienvenue" apparaisse
    Wait Until Element Exists    name=Bienvenue    timeout=30s

    # Maintenant on est sûr que l'app est prête
    Wait Until Element Exists    name=Poste    timeout=20s
    Wait Until Element Exists    name=Mot de passe    timeout=20s
    Wait Until Element Exists    name=Connexion    timeout=20s

    # Saisie
    Set Editbox Text    name=Poste    Dev
    Set Editbox Text    name=Mot de passe    souris

    # Action
    Click    name=Connexion

    # Vérification après login
    Wait Until Element Exists    name=LISTES    timeout=30s

    Log    Connexion effectuée