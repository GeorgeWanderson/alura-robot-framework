*** Settings ***
Library          SeleniumLibrary
Library          FakerLibrary    locale=pt_BR
Resource         setup_teardown.robot
Test Setup       Dado que eu acesso o Organo
Test Teardown    Fechar o navegador

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
${OPCAO_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPCAO_FRONT}            //option[contains(.,'Front-End')]
${OPCAO_DADOS}            //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}           //option[contains(.,'Devops')] 
${OPCAO_UX}               //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}           //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}         //option[contains(.,'Inovação e Gestão')]

*** Test Cases ***
Verificar se ao preencher os campos do formulário corretamentee os dados são inseridos na lista e se um novo card é criado no time esperado
    Dado que preencho os campos do formulário
    E clico no botão criar card
    Então identificar o card no time esperado

Verificar se é possível criar mais de um card se preenchermos os campos corretamente
    Dado que preencho os campos do formulário
    E clico no botão criar card
    Então identificar 3 cards no time esperado
    
*** Keywords ***    
Dado que preencho os campos do formulário
    ${Nome}          FakerLibrary.First Name
    Input Text       ${CAMPO_NOME}      ${Nome}
    ${Cargo}         FakerLibrary.Job
    Input Text       ${CAMPO_CARGO}     ${Cargo}
    ${Imagem}        FakerLibrary.Image Url
    Input Text       ${CAMPO_IMAGEM}    ${Imagem}
    Click Element    ${CAMPO_TIME}
    Click Element    ${OPCAO_PROGRAMACAO}
E clico no botão criar card
    Click Element    ${BOTAO_CARD}
Então identificar o card no time esperado
    Element Should Be Visible    class:colaborador
Então identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE    1    3
        
        Dado que preencho os campos do formulário
        E clico no botão criar card       
    END
    Sleep    10s