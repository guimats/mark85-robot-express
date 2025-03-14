*** Settings ***
Documentation        Cenários de tentativa de cadastro com senha muito curta

Resource             ../resources/base.resource
Test Template        Short password

Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Não deve logar com senha de 1 digito    1
Não deve logar com senha de 2 digito    12
Não deve logar com senha de 3 digito    123
Não deve logar com senha de 4 digito    1234
Não deve logar com senha de 5 digito    12345


*** Keywords ***
Short password
   [Arguments]    ${short_pass}

    ${user}    Create Dictionary
    ...    name=Guilherme Silva
    ...    email=guilherme@msn.com
    ...    password=${short_pass}
    
    Go to signup page
    Submit signup form         ${user}
    
    Alert should be            Informe uma senha com pelo menos 6 digitos