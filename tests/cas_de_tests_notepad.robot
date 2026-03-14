*** Settings ***
Library PywinautoLibrary

*** Test Cases ***
Open Notepad, Type Text and Save
     Launch Application notepad.exe
     Get Dialog From Regex .*Sans titre
     Type Text Edit Hello, World!
     Menu Select Fichier->&Enregistrer sous...
     Get Dialog Enregistrer sous
     Type Text edit1 TEST_ROBOT.txt
     Click Enregistrer
     Close Application