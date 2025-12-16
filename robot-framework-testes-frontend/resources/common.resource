*** Settings ***
Library    SeleniumLibrary
Resource   ../config/dev.robot
Library    BuiltIn


*** Keywords ***
Abrir Navegador
    ${ci}=    BuiltIn.Get Environment Variable    CI    false
    Run Keyword If    '${ci}' == 'true'    Abrir Navegador Headless
    ...    ELSE    Abrir Navegador Interface


Abrir Navegador Interface
    Open Browser    ${BASE_URL_UI}    Chrome
    Maximize Browser Window


Abrir Navegador Headless
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Open Browser    ${BASE_URL_UI}    chrome    options=${options}


Fechar Navegador
    Close Browser