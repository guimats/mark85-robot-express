*** Settings ***

Library    Browser
Resource    ../env.resource

*** Keywords ***

Submit login form
    [Arguments]    ${user}

    Fill Text    id=email        ${user}[email]
    Fill Text    id=password     ${user}[password]
    Click        id=buttonLogin