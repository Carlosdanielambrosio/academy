*** Settings ***
Resource    ../../resources/common.resource
Resource    ../../resources/login.resource
Resource    ../../config/dev.robot

Suite Setup     Abrir Navegador
Suite Teardown  Fechar Navegador

*** Test Cases ***
Cenario 01: Realizar Login com Sucesso
    Realizar Login
    Verificar Redirecionamento Para Home
    Verificar Elemento Cadastros Visivel
