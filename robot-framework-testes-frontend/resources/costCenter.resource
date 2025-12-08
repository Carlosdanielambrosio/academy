*** Settings ***
Library    SeleniumLibrary
Resource    ../config/dev.robot
Resource    login.resource
Resource    generate_random_data.resource

*** Keywords ***
Acessar Pagina Centro de Custos
    Click Element    id:Cadastros

    Wait Until Element Is Visible    id:Centro de Custo    timeout=20s
    Click Element    id:Centro de Custo

    Wait Until Location Is    ${BASE_URL_UI}/costCenter    timeout=10s
    Location Should Be    ${BASE_URL_UI}/costCenter

    Wait Until Element Is Visible    xpath://h1[text()='Centro de Custo']    timeout=10s
    Element Text Should Be    xpath://h1[text()='Centro de Custo']    Centro de Custo


Cadastrar novo Centro de Custo
    Wait Until Element Is Visible    xpath://button[text()='Novo Centro de Custo']    timeout=10s
    Click Button    xpath://button[text()='Novo Centro de Custo']

    Wait Until Element Is Visible    xpath://h2[text()='Novo Centro de Custo']    timeout=10s
    Element Should Be Visible    xpath://h2[text()='Novo Centro de Custo']

    ${costCenterName}    Gerar Centro de Custo
    Input Text    id:costCentername    ${costCenterName}

    Wait Until Element Is Visible    xpath=//select    timeout=10s
    Sleep    2s
    
    ${itens}=    Get List Items    xpath=//select
    
    ${itens_filtrados}=    Create List

    FOR    ${item}    IN    @{itens}
        Run Keyword If    '${item}' != '' and '${item}' != 'Centro de Custo'    
        ...    Append To List    ${itens_filtrados}    ${item}
    END
    
    ${primeiro}=    Get From List    ${itens_filtrados}    0
    
    Select From List By Label    xpath=//select    ${primeiro}

    Wait Until Element Is Visible    xpath://button[text()='Salvar']    timeout=10s
    Click Button    xpath://button[text()='Salvar']
    
    Sleep    10s