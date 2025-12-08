*** Settings ***
Resource    ../../resources/login.resource
Resource    ../../resources/common.resource
Resource    ../../resources//costCenter.resource

Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador

*** Test Cases ***
Cenario 01: Cadastrar centro de custo
    Realizar Login
    Verificar Redirecionamento Para Home
    Verificar Elemento Cadastros Visivel
    Acessar Pagina Centro de Custos
    Cadastrar novo Centro de Custo