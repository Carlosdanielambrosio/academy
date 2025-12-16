*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../config/dev.robot



*** Keywords ***
Abrir Navegador
    ${headless}=    Get Environment Variable    CI    default=False
    Run Keyword If    '${headless}' == 'true'    Abrir Navegador Headless
    ...    ELSE    Abrir Navegador Interface


Abrir Navegador Interface
    Open Browser    ${BASE_URL_UI}    Chrome
    Maximize Browser Window


Abrir Navegador Headless
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument      headless
    Call Method    ${options}    add_argument      no-sandbox
    Call Method    ${options}    add_argument      disable-dev-shm-usage
    Open Browser    ${BASE_URL_UI}    chrome    options=${options}


Fechar Navegador
    Close Browser
