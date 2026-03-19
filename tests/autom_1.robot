*** Settings ***
Library           PywinautoLibrary
Library           Process

*** Test Cases ***
Open Notepad, Type Text, Save and Close
    # 1. Lancement et préparation
    Launch Application    notepad.exe
    Sleep    2s
    Get Dialog From Regex    .*Sans titre.*

    # 2. Saisie du texte
    Type Text    Edit    Hello, World!

    # 3. Sauvegarde (Correction des sélecteurs et titres)
    Menu Select    Fichier->&Enregistrer sous...
    
    # On attend que la fenêtre de sauvegarde apparaisse (Regex pour plus de flexibilité)
    Wait For Connection    window_title_re=.*Enregistrer sous.* timeout=10
    Get Dialog From Regex    .*Enregistrer sous.*
    
    # Saisie du nom du fichier et validation
    Type Text    Edit    edition_autom.txt
    Click    Enregistrer
    
    # Petit délai pour laisser le temps au fichier d'être écrit sur le disque du VPS
    Sleep    2s

    # 4. Fermeture propre par le menu "Quitter"
    # On refocus sur la fenêtre qui a changé de nom (maintenant TEST_ROBOT.txt)
    Run Keyword And Ignore Error    Get Dialog From Regex    .*TEST_ROBOT.txt.*
    Run Keyword And Ignore Error    Menu Select    Fichier->Quitter

    # 5. Sécurité pour Squash TM : On s'assure que le processus est mort
    # Cela libère les verrous sur les fichiers de log pour l'OpenTestFactory
    Terminate Process    notepad.exe    kill=True