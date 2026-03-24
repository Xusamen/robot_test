*** Settings ***
Library    Process
Library    PywinautoLibrary

*** Test Cases ***
Test Lancement Application Java
    [Teardown]    Terminate All Processes

    Start Process    "C:\Users\recette_windows\Desktop\TEST_RECETTE_AUTOM\start_2.bat"
    ...    shell=True

    # Laisser le temps à la JVM + UI de charger
    Sleep    8s

    Connect To Application    title_re=.*DAFRA AUTO-ECOLE SCHEDULER.*
    # Vérifier que la fenêtre principale est bien apparue
    Get Dialog From Regex    .*DAFRA AUTO-ECOLE SCHEDULER.*

    Log    Application démarrée avec succès