*** Settings ***
Library           PywinautoLibrary

*** Test Cases ***
Open Notepad, Type Text, Save and Close
    # 1. Lancement de l'application
    Launch Application    notepad.exe
    Sleep    2s
    
    # 2. Utilisation d'une Regex souple pour capturer "Sans titre - Bloc-notes"
    # Le '.*' avant et après permet de s'affranchir des variations de titre
    Get Dialog From Regex    .*Sans titre.*
    
    # 3. Saisie du texte (Sur Win10, le contrôle s'appelle généralement 'Edit')
    Type Text    Edit    Hello, World!

    # 4. Enregistrement (Utilisation des raccourcis & pour plus de fiabilité)
    # &F correspond à l'accélérateur ALT+F pour le menu Fichier
    Menu Select    Fichier->Enregistrer sous...
    
    # 5. Fenêtre d'enregistrement
    # On attend que la boîte de dialogue apparaisse (timeout de 5s)
    Wait For Window    title=Enregistrer sous    timeout=5
    Type Text    Edit1    autom_win10.txt
    Click    Enregistrer
    
    # 6. Fermeture propre
    Sleep    1s
    Menu Select    Fichier->Quitter