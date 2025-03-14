*** Settings ***
Documentation        Ações e elementos da página de cadastro de tarefas

Library        Browser

*** Keywords ***
 Submit task form
     [Arguments]        ${task}

     ${tags_element}        Set Variable        css=input[name=tags] 

     Fill Text    css=input[placeholder$=tarefa]    ${task}[name]

     FOR    ${tag}    IN    @{task}[tags]
         Fill Text     ${tags_element}        ${tag}
         Sleep         0.5
         Press Keys    ${tags_element}        Enter
     END


     Click    css=button >> text=Cadastrar