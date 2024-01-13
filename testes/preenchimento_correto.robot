*** Settings ***
Resource         ../resource/main.robot
Test Setup       Dado que eu acesso o Organo
Test Teardown    Fechar o navegador


*** Test Cases ***
Verificar se ao preencher os campos do formulário corretamentee os dados são inseridos na lista e se um novo card é criado no time esperado
    Dado que preencho os campos do formulário
    E clico no botão criar card
    Então identificar o card no time esperado

Verificar se é possível criar mais de um card se preenchermos os campos corretamente
    Dado que preencho os campos do formulário
    E clico no botão criar card
    Então identificar 3 cards no time esperado
    
Verificar se é possível criar um card para cada time disponível se preenchermos os campos corretamente
    Dado que preencho os campos do formulário
    Então criar e identificar 1 card em cada time disponível


