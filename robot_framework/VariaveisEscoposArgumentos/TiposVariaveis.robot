*** Settings ***
Documentation
*** Variables ***
${SIMPLES}        Conheça o novo aluno do Academy QACoders

@{FRUTAS}  Maçã    Banana    Laranja    Uva    Abacaxi    Manga

&{PESSOA}    nome=João Silva    idade=30   cidade=São Paulo    profissão=Engenheiro

*** Test Cases ***
Caso de teste de exemplo
    Uma keyword qualquer 01


*** Keywords ***
Uma keyword qualquer 01
    Log    ${SIMPLES}
    Log    Essa fruta deve ser maçã: ${FRUTAS[0]}
    Log    Essa fruta deve ser laranja: ${FRUTAS[2]}
    Log    Nome da pessoa: ${PESSOA.nome}
    Log    Idade da pessoa: ${PESSOA.idade}
    Log    ${SIMPLES}: o nome dele é ${PESSOA.nome} e ele gosta muito de ${FRUTAS[5]}
    Log Many    @{FRUTAS}