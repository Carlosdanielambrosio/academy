*** Settings ***
Documentation    Configurações específicas do ambiente de Desenvolvimento

*** Variables ***
${baseUrl}       https://api-blacklist.qacoders.dev.br/api/
${newPassword}     1223@Test
${newPasswordConf}      1223@Test
${user_id}       68e01e8001b4c8756f5b934e
${invalid_id}    9999999


${pass_more_than_12}       Abcdefghijklm123!


${pass_less_than_12}       Abc123!


${pass_confirm_wrong}      Senha123!
${pass_original}           Senha1234!


${pass_empty}              ${EMPTY}


${pass_no_lowercase}       ABCDEF123!


${pass_no_uppercase}       abcdef123!


${pass_no_numbers}         Abcdefghi!


${pass_no_special}         Abcd1234


${previous_password}       OldPass123!