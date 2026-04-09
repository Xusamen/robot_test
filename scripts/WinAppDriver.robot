*** Settings ***
Library           AppiumLibrary

*** Variables ***
${WAD_URL}        http://127.0.0.1:4723
${APP_BAT}        C:\\Users\\recette_windows\\Desktop\\TEST_RECETTE_AUTOM\\script_2.bat

*** Test Cases ***
Test Connexion Simple
    # 1. Ouvre l'application
    Open Application    ${WAD_URL}    
    ...    platformName=Windows    
    ...    deviceName=WindowsPC    
    ...    app=${APP_BAT}
    
    # 2. Attend que l'application soit chargée (20 secondes max)
    Sleep    5s
    
    # 3. Clique sur le champ "Nom d'utilisateur" puis tape du texte
    Click Element    name=Poste
    Press Keys       None    YannChristian
    
    # 4. Pause pour que tu voies ce qui se passe
    Sleep    3s
    
    # 5. Ferme l'application
    Close Application