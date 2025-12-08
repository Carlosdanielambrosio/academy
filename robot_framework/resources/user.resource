  *** Settings ***

  Library    SeleniumLibrary
  Library     RequestsLibrary
  Library     String
  Library     Collections
  Resource    ../resources/generate_random_data.resource
  Resource    ../config/dev.resource

  *** Keywords ***
  # create dictionary vai criar e retornar um dictionary
  Criar Sessao 
        ${headers}     Create Dictionary     accept=application/json     Content-Type=application/json
        Create Session     alias=develop     url=${baseUrl}     headers=${headers}     verify=true


  Pegar Token
        ${body}     Create Dictionary     mail= blacklist@qa.com         password=1234@Test
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



  Delete User by id
        ${token}    Pegar Token
        ${id}       Pegar ID  ${token}
        DELETE On Session    alias=develop   url=/user/${id}?token=${token}


  Create new user
       ${token}    Pegar Token
       ${id}       Pegar ID  ${token}
        fullName=Teste do Teste
        mail=test@test.com.br
        accessProfile=ADMIN
        cpf=11122233344
        password=1234@Test
        confirmPassword=1234@Test

DELETE On Session    alias=develop   url=/user?token=${token}