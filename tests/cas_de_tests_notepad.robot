*** Settings ***
Library           PywinautoLibrary

*** Test Cases ***
Open Notepad, Type Text, Save and Close
    Launch Application    notepad.exe
    Get Dialog From Regex    .*Sans titre

    Type Text    Edit    Hello, World!

    Menu Select    Fichier->&Enregistrer sous...
    Get Dialog    Enregistrer sous
    Type Text    edit1    TEST_ROBOT.txt
    Click    Enregistrer

    Close Window

    # Gérer la boîte de dialogue "Voulez-vous enregistrer" si elle apparaît
    Run Keyword And Ignore Error    Get Dialog From Regex    .*Notepad
    Run Keyword And Ignore Error    Click    &Oui
