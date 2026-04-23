*** Settings ***
Documentation    Suite generee automatiquement via Robot Bridge
Library          SikuliLibrary
Library          OperatingSystem

Resource         ../resources/gherkin.resource

Suite Setup      Initialiser Sikuli
Suite Teardown   Fermer Sikuli

*** Variables ***
${IMAGES_DIR}    ${CURDIR}/../images

*** Test Cases ***
Authentification réussie
    Démarrer l'environnement de test
    je saisis    Dev
    je saisis    souris
    je clique sur le bouton    bouton_connexion
    l'image doit être visible    icone
