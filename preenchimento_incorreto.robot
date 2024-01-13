*** Settings ***
Library          SeleniumLibrary
Resource         setup_teardown.robot
Test Setup       Dado que eu acesso o Organo
Test Teardown    Fechar o navegador

*** Variables ***
${BOTAO_CARD}  id:form-botao
${MENSAGEM_CAMPO_OBRIGATORIO_NOME}  id:form-nome-erro

*** Test Cases ***
Verificar se quando um campo obrigatório não for preenchido corretamente o sistema exibe uma mensagem de campo obrigatório
    Dado que eu clique no botão criar card
    Então sistema deve apresentar mensagem de campo obrigatório

*** Keywords ***
Dado que eu clique no botão criar card
    Click Element    ${BOTAO_CARD}
Então sistema deve apresentar mensagem de campo obrigatório
    Element Should Be Visible    ${MENSAGEM_CAMPO_OBRIGATORIO_NOME}
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro