*** Settings ***
Library           PywinautoLibrary

*** Test Cases ***
Open Notepad, Type Text, Save and Close
    # 1. Lancement de l'application
    Launch Application    notepad.exe
    Sleep    2s

    # 2. Connexion à la fenêtre principale via regex
    Get Dialog From Regex    .*Sans titre.*

    # 3. Saisie du texte
    Type Text    Edit    Hello, World!

    # 4. Ouverture du menu Enregistrer sous
    Menu Select    Fichier->Enregistrer sous...
    Sleep    2s

    # 5. Connexion à la boîte de dialogue "Enregistrer sous"
    #    On utilise Get Dialog From Regex au lieu de Wait For Window
    Get Dialog From Regex    .*Enregistrer sous.*

    # 6. Saisie du nom de fichier dans le champ Edit du dialogue
    Type Text    Edit1    autom_win10.txt

    # 7. Clic sur le bouton Enregistrer
    Click    Enregistrer
    Sleep    1s

    # 8. Fermeture propre
    Menu Select    Fichier->Quitter