*** Settings ***
Documentation   Exemplo de escopo de variáveis: GLOBAIS, SUITE, TESTE (test case) e KEYWORD (local)
Library         String

*** Variables ***
${GLOBAL_INSTANCIADA}     Minha variável GLOBAL_INSTANCIADA foi instanciada para a suíte
#declarada estaticamente

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01
    Uma keyword qualquer 02

Caso de teste de exemplo 02
    Uma keyword qualquer 02

Caso de teste de exemplo 03
    Uma keyword qualquer 02
    Uma keyword qualquer 03
    Uma keyword qualquer 08

Caso de teste de exemplo 04
    Uma keyword qualquer 04
    Uma keyword qualquer 05

Caso de teste de exemplo 05
    Uma keyword qualquer 05
    Uma keyword teste

Caso de teste de exemplo 06
    Uma keyword qualquer 06
    Uma keyword qualquer 07

*** Keywords ***
Uma keyword qualquer 01
    ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}  Generate Random String
    Set Global Variable    ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}
    Set Suite Variable    ${SUITE_CRIADA_EM_TEMPO_EXECUCAO}    Variável da suite de teste variaveis.robot
    Set Test Variable    ${TEST_CRIADA_EM_TEMPO_DE_EXECUCAO}    Variável do caso de teste Caso de teste de exemplo 01
    ${KEYWORD_CRIADA_EM_TEMPO_DE_EXECUCAO}    Set Variable    Variável da keyword Uma keyword qualquer 01
    Log    ${KEYWORD_CRIADA_EM_TEMPO_DE_EXECUCAO}

Uma keyword qualquer 02
    ${KEYWORD_CRIADA_EM_TEMPO_DE_EXECUCAO}    Set Variable    Variável da keyword Uma keyword qualquer 02
    Log    ${KEYWORD_CRIADA_EM_TEMPO_DE_EXECUCAO}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO}
    Set Test Variable    ${TEST_CRIADA_EM_TEMPO_DE_EXECUCAO}    Blacklist Academy

Uma keyword qualquer 03
    ${KEYWORD_CRIADA_EM_TEMPO_DE_EXECUCAO}    Set Variable    Variável da keyword Uma keyword qualquer 03
    Log    ${KEYWORD_CRIADA_EM_TEMPO_DE_EXECUCAO}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO}
    #Log    ${TEST_CRIADA_EM_TEMPO_DE_EXECUCAO}
    Set Test Variable    ${TEST_CRIADA_EM_TEMPO_DE_EXECUCAO}    Blacklist Academy 2

Uma keyword qualquer 04
    Set Test Variable    ${TEST_CRIADA_EM_TEMPO_DE_EXECUCAO}    Variável do caso de teste Caso de teste de exemplo 01
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}
    Log     ${SUITE_CRIADA_EM_TEMPO_EXECUCAO}

Uma keyword qualquer 05
     Set Test Variable    ${TEST_CRIADA_EM_TEMPO_DE_EXECUCAO}    Finalizar a aula
    Log    ${TEST_CRIADA_EM_TEMPO_DE_EXECUCAO}

Uma keyword teste
    ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}  Generate Random String
    Set Global Variable    ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}


Uma keyword qualquer 06
    ${KEYWORD_CRIADA_EM_TEMPO_DE_EXECUCAO}    Set Variable    Variável da keyword Uma keyword qualquer 06
    Set Test Variable    ${TEST_CRIADA_EM_TEMPO_DE_EXECUCAO}    Variável do caso de teste Caso de teste de exemplo 06

Uma keyword qualquer 07
    ${KEYWORD_CRIADA_EM_TEMPO_DE_EXECUCAO}    Set Variable    Variável da keyword Uma keyword qualquer 07
    Log    ${KEYWORD_CRIADA_EM_TEMPO_DE_EXECUCAO} / ${TEST_CRIADA_EM_TEMPO_DE_EXECUCAO}

Uma keyword qualquer 08
    Log    ${GLOBAL_INSTANCIADA}