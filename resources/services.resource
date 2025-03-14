*** Settings ***
Documentation        Consumindo a API REST do sistema Mark85

Library        RequestsLibrary

*** Keywords ***
POST user session
    [Arguments]        ${user}
    
    # adaptando user para formato de POST de sessão de usuário
    ${payload}        Create Dictionary
    ...    email=${user}[email]
    ...    password=${user}[password]
    
    # enviando o POST com as informações do usuário e salvando retorno em var resp
    ${resp}    POST    url=http://localhost:3333/sessions
    ...     json=${payload}
    ...     expected_status=200
    
    # pegando o TOKEN da resposta do POST da API
    ${token}    Set Variable    ${resp.json()}[token]
    
    # permite que a variavel seja utilizada em qualquer teste do projeto
    Set Test Variable   ${token}

POST a new task
    [Arguments]        ${payload}
    
    # criando header com o TOKEN de autorização para conseguir criar task
    ${headers}        Create Dictionary
    ...        Authorization=${token}
    
    # enviando task via POST com as informações da task (payload) e a auth (headers)
    POST    url=http://localhost:3333/tasks
    ...     json=${payload}
    ...     headers=${headers}
    ...     expected_status=201