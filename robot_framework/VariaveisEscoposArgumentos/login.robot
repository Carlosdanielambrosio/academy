*** Settings ***
Documentation     Pegar Token


Library     RequestsLibrary
Library     String
Library     Collections


*** Variables ***
${baseUrl}       https://api-blacklist.qacoders.dev.br/api/



*** Test Cases ***
Validar Login
      Realizar Login
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

*** Keywords ***
# create dictionary vai criar e retornar um dictionary
Criar Sessao 
       ${headers}     Create Dictionary     accept=application/json     Content-Type=application/json
       Create Session     alias=develop     url=${baseUrl}     headers=${headers}     verify=true


Realizar Login
      ${body}     Create Dictionary     mail=sysadmin@qacoders.com    password=1234@Test
      Log    ${body}
      #vai dar continuidade no criar sessao
      # vai ser usado o criar sessao de cima com parametros diferentes
      Criar Sessao 
      ${resposta}     POST On Session    alias=develop      url=/login   json=${body}
    # Log To Console     ${resposta.json()} 
    # Log To Console     ${resposta.json()["token"]}
      Status Should be   200     ${resposta}
