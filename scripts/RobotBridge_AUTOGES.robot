*** Settings ***
# On importe le fichier de ressources cree precedemment
Resource          gherkin.resource

# On prepare et on nettoie l environnement Sikuli ici
Test Setup        Demarrer l'environnement de test
Test Teardown     Stop Sikuli Process

*** Test Cases ***
Authentification réussie
    [Documentation]    AUTH AUTOGES

    Given je lance l'application AUTOGES
    When je saisis "Dev" sur l'image "champ_poste"
    And je saisis "souris" sur l'image "champ_mot_de_passe"
    And je clique sur le bouton "bouton_connexion"
    Then l'image "icone" doit être visible
