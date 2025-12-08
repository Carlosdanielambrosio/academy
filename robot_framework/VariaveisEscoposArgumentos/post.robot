*** Settings ***
Documentation     Teste Projeto





*** Variables ***
${nome}    Carlos Daniel Ambrosio


***Test Cases ***

Imprimir Nome no Terminal
     Imprimir Nome


*** Keywords ***
Imprimir Nome
    Log To Console    Ola  ${nome},  Seja bem Vindo ao dojo de Robot