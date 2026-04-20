# language: fr
Fonctionnalité: Gherkin_Strat
  Scénario: Authentification réussie
    Etant donné que je lance l'application AUTOGES
    Quand je saisis "Dev" sur l'image "champ_poste"
    Et que je saisis "souris" sur l'image "champ_mot_de_passe"
    Et que je clique sur le bouton "bouton_valider"
    Alors l'image "icone" doit être visible