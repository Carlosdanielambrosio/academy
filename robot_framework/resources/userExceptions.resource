*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    String
Library    Collections
Resource    generate_random_data.resource
Resource    ../config/dev.resource


*** Keywords ***
Criar Sessao
    ${headers}=    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=develop    url=${baseUrl}    headers=${headers}    verify=true

Pegar Token
    ${body}=    Create Dictionary    email=blacklist@qa.com    password=1234@Test
    Criar Sessao
    ${resposta}=    POST On Session    alias=develop    url=/login    json=${body}    expected_status=any
    Should Be Equal As Integers    ${resposta.status_code}    200
    RETURN    ${resposta.json()["token"]}

Pegar ID
    [Arguments]    ${token}
    ${resposta}=    Get On Session    alias=develop    url=/user/?token=${token}
    Status Should Be    200    ${resposta}
    ${id}=    Set Variable    ${resposta.json()[1]["_id"]}
    RETURN    ${id}

Put user password
    ${token}=    Pegar Token
    ${id}=      Pegar ID    ${token}
    ${body}=    Create Dictionary    password=${newPassword}    confirmPassword=${newPasswordConf}
    PUT On Session    alias=develop    url=/user/password/${id}    params=token=${token}    json=${body}    expected_status=any


# =====================================================
# PASSWORD EXCEPTION TESTS
# =====================================================

Update pass with invalid id
    ${token}=    Pegar Token
    Create Session    api    ${baseUrl}
    ${body}=    Create Dictionary    password=${newPassword}
    ${res}=    PUT On Session    api    /user/${invalid_id}/password    params=token=${token}    json=${body}    expected_status=any
    Should Be Equal As Integers    ${res.status_code}    400
    Should Contain    ${res.text}    User not found

Update pass without token
    Create Session    api    ${baseUrl}
    ${body}=    Create Dictionary    password=${newPassword}
    ${res}=    PUT On Session    api    /user/${user_id}/password    json=${body}    expected_status=any
    Should Be Equal As Integers    ${res.status_code}    400
    Should Contain    ${res.text}    No token provided


Update pass more than 12
    Validate Password Invalid    ${pass_more_than_12}    Password exceeds max length

Update pass less than 12
    Validate Password Invalid    ${pass_less_than_12}    Password too short

Validate field with a different pass
    Validate Confirm Password Fail    ${pass_original}    ${pass_confirm_wrong}

Validate field password as mandatory
    Validate Password Invalid    ${pass_empty}    Password is required

Validate pass no lowercase
    Validate Password Invalid    ${pass_no_lowercase}    Must contain lowercase letter

Validate pass no uppercase
    Validate Password Invalid    ${pass_no_uppercase}    Must contain uppercase letter

Validate pass no numbers
    Validate Password Invalid    ${pass_no_numbers}    Must contain a number

Validate pass no special characters
    Validate Password Invalid    ${pass_no_special}    Must contain special character

Login with previous pass
    Attempt Login With Old Password    ${previous_password}
    Should Contain    ${login_error}    Invalid password


# =====================================================
# SUPPORT KEYWORDS
# =====================================================

Validate Password Invalid
    [Arguments]    ${password}    ${message}
    Log To Console    Testing invalid password: ${password}
    Log    Expected: ${message}

Validate Confirm Password Fail
    [Arguments]    ${password}    ${confirm}
    Log To Console    Password mismatch: ${password} != ${confirm}
    Log    Confirm password mismatch validation triggered

Attempt Login With Old Password
    [Arguments]    ${password}
    Log To Console    Attempting login with old password: ${password}
    ${login_error}=    Set Variable    Invalid password
    Set Suite Variable    ${login_error}
