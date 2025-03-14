*** Settings ***
Documentation        Ações e elementos do cabeçalho do mark85

Library        String
Library        Browser



*** Keywords ***
User should be loged in
    [Arguments]    ${name}
    
    @{splited_name}    Split String    ${name}
    ${element}         Set Variable   header .right small 

    Wait For Elements State    css=${element}  
    ...    visible    5
    Get Text    css=${element}    equal    Olá, ${splited_name}[0]

Go to task form
    Click    css=.button-add