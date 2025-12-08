*** Settings ***
Documentation
*** Variables ***
&{PESSOA}    NOME=João Silva    IDADE=9   CIDADE=São Paulo    PROFISSAO=Engenheiro

*** Test Cases ***
Caso de teste de exemplo
    Uma keyword com argumentos    ${PESSOA.NOME}    ${PESSOA.IDADE}
    Uma keyword com retorno sem argumentos
    
Caso de teste de exemplo 2
    ${MENSAGEM}    Uma keyword com argumentos e retorno    ${PESSOA.NOME}    ${PESSOA.IDADE}
    Log    A mensagem retornada foi: ${MENSAGEM}


Caso de teste de exemplo 3
    ${MENSAGEM_FIXA}    Uma keyword com retorno sem argumentos
    Log    A mensagem retornada foi: ${MENSAGEM_FIXA}

*** Keywords ***
Uma keyword com argumentos
    [Arguments]    ${NOME_PESSOA}    ${IDADE_PESSOA}
    Log    O nome da pessoa é ${NOME_PESSOA} e a idade é ${IDADE_PESSOA}

Uma keyword com argumentos e retorno
    [Arguments]    ${nome}    ${idade}
    ${MENSAGEM}    Set Variable If    ${idade}<18    ${nome} é menor de idade.    ${nome} é maior de idade. 
    [Return]    ${MENSAGEM}

Uma keyword com retorno sem argumentos
    ${MENSAGEM_DE_RETORNO}    Set Variable If    10<18    10 é menor que 18.    10 não é maior que 18
    [Return]    ${MENSAGEM_DE_RETORNO}