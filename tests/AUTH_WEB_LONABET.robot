*** Settings ***
Library    Browser

*** Variables ***
${URL}           https://m.lonabet.bf/
${PHONE}         67971556
${PASSWORD}      1472

*** Test Cases ***
Test Authentification Par Telephone
    New Browser    chromium    headless=False
    New Context
    New Page    ${URL}

    # Attendre que la page soit chargée (max 20s)
    Wait For Load State    load    timeout=20s

    # Si bouton OK existe → cliquer
    ${ok_present}=    Run Keyword And Return Status    Wait For Elements State    text=OK    visible    timeout=3s
    IF    ${ok_present}
        Click    text=OK
    END

    # Gérer popup promotion
    WHILE    True
        ${promo_present}=    Run Keyword And Return Status    Wait For Elements State    text=PROCHAINE PROMOTION    visible    timeout=3s
        IF    not ${promo_present}
            BREAK
        END

        Click    text=PROCHAINE PROMOTION

        ${close_present}=    Run Keyword And Return Status    Wait For Elements State    text=CLOSE    visible    timeout=5s
        IF    ${close_present}
            Click    text=CLOSE
            BREAK
        END
    END

    # Cliquer sur Connexion
    Click    text=Connexion

    # Saisie téléphone
    Fill Text    input[name="Numéro de téléphone"]    ${PHONE}

    # Saisie mot de passe
    Fill Text    input[name="Mot de passe"]    ${PASSWORD}

    # Valider
    Click    button[type="submit"]

    # Vérification
    Wait For Elements State    text=Tickets    visible    timeout=10s

    Close Browser