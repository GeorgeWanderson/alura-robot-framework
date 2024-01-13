*** Settings ***
Resource         ../resource/main.robot
Test Setup       Dado que eu acesso o Organo
Test Teardown    Fechar o navegador

*** Variables ***
${BOTAO_CARD}  id:form-botao
${MENSAGEM_CAMPO_OBRIGATORIO_NOME}  id:form-nome-erro

*** Test Cases ***
Verificar se quando um campo obrigatório não for preenchido corretamente o sistema exibe uma mensagem de campo obrigatório
    Dado que eu clique no botão criar card
    Então sistema deve apresentar mensagem de campo obrigatório


