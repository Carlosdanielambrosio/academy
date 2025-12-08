*** Settings ***
Documentation     Pegar Token


Library     RequestsLibrary
Library     String
Library     Collections

#teste     69092b70ec110178464ac3ca
*** Variables ***
${baseUrl}       https://api-blacklist.qacoders.dev.br/api/
${newPassword}     1223@Test
${newPasswordConf}      1223@Test
${user_id}       69092b70ec110178464ac3ca

*** Test Cases ***
Listagem users
    Listagem users

*** Test Cases ***
Count Users
    Count Users

*** Test Cases ***
Get users by id
    Get User by id

*** Test Cases ***
Update User password
    Put user password

*** Keywords ***
# create dictionary vai criar e retornar um dictionary
Criar Sessao 
       ${headers}     Create Dictionary     accept=application/json     Content-Type=application/json
       Create Session     alias=develop     url=${baseUrl}     headers=${headers}     verify=true


Pegar Token
      ${body}     Create Dictionary     mail=testeee@test.com.br         password=1234@Test
      Log    ${body}
      #vai dar continuidade no criar sessao
      # vai ser usado o criar sessao de cima com parametros diferentes
      Criar Sessao 
      ${resposta}     POST On Session    alias=develop      url=/login   json=${body}
    # Log To Console     ${resposta.json()} 
    # Log To Console     ${resposta.json()["token"]}
      Status Should be   200     ${resposta}
      RETURN           ${resposta.json()["token"]}        
    
Pegar ID
    [Arguments]    ${token}
    ${resposta}    Get On Session    alias=develop    url=/user/?token=${token}
    Status Should Be   200   ${resposta}

    Log To Console    ${resposta.json()}

   # nessa parte eu vou pegar a id do usuario index 0
    ${id}    Set Variable    ${resposta.json()[1]["_id"]}

    RETURN    ${id}

    
Listagem users
       ${token}     pegar Token
    Get On Session     alias=develop    url=/user/?token=${token}


Count Users
        ${token}     pegar Token
    Get On Session     alias=develop    url=/user/Count?token=${token}

Get User by id
      ${token}    Pegar Token
      ${id}       Pegar ID  ${token}
    Get On Session    alias=develop   url=/user/${id}?token=${token}

Put user password
     ${token}      Pegar Token
     ${id}         Pegar ID   ${token}
     ${body}       Create Dictionary    password=${newPassword}    confirmPassword=${newPasswordConf}
     PUT On Session    alias=develop      url=/user/password/${user_id}?token=${token}       json=${body}