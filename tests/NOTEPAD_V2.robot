*** Settings ***
Library           PywinautoLibrary

*** Test Cases ***
Open Notepad, Type Text, Save and Close
    # 1. Lancement de l'application
    Launch Application    notepad.exe
    Sleep    2s

    # 2. Connexion à la fenêtre principale
    Get Dialog From Regex    .*Sans titre.*

    # 3. Saisie du texte
    Type Text    Edit    Hello, World!

    # 4. Ouverture du menu Enregistrer sous via raccourci clavier (plus fiable)
    Send Keys    ^s
    Sleep    3s

    # 5. Connexion à la boîte de dialogue "Enregistrer sous"
    Get Dialog From Regex    .*Enregistrer sous.*|.*Save As.*
    Sleep    1s

    # 6. Saisie du nom de fichier et confirmation
    Type Text    Edit1    autom_win10.txt
    Click    Enregistrer
    Sleep    2s

    # 7. RE-CONNEXION à Notepad avec son nouveau titre après enregistrement
    Get Dialog From Regex    .*autom_win10.*

    # 8. Fermeture propre avec le nouveau titre
    Menu Select    Fichier->Quitter
```

---

## Explication de la correction clé

Après l'enregistrement, le titre change de `Sans titre - Bloc-notes` vers `autom_win10 - Bloc-notes`. PywinautoLibrary perd la référence à la fenêtre. Il faut **reconnecter explicitement** avec le nouveau titre avant d'exécuter le `Menu Select` de fermeture.
```
Avant enregistrement :  "Sans titre - Bloc-notes"
Après enregistrement :  "autom_win10 - Bloc-notes"  ← nouvelle connexion requise