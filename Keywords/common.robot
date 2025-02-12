*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    DateTime
Variables     ${CURDIR}/../PageObject/locators.py
Resource       ${CURDIR}/../Resources/Variables/zohovariables.robot



*** Keywords ***

Open Zoho CRM
    [Documentation]    Open Zoho CRM in the browser and wait for the login page to load
    Open Browser    ${zohourl}    ${browser}
    Maximize Browser Window
    Wait Until Keyword Succeeds    3x    15s    Click Element       ${signin_loc}
    

Login to Zoho CRM
    [Documentation]    Login to Zoho CRM with the given username and password
    [Arguments]    ${username}    ${password}
    Wait Until Page Contains Element    ${googlesign_loc}
    Input Text        ${login_loc}    ${username}
    Click Element     ${nextbtn_loc}
    Input Password    ${password_loc}    ${password}
    Click Element     ${nextbtn_loc}

Navigate to Create Leads Section
    [Documentation]    Navigate to the create leads section and wait for the page to load
    Navigate to leads section
    Wait Until Element Is Visible    ${totalrecrds_loc}
    Click Element   ${createleadsec_loc}
    Wait Until Element is Visible     ${leadflow_loc}


Navigate to leads section
    [Documentation]    Navigate to the leads section and wait for the page to load
    ${Date}    Get Current Date    result_format=%Y%m%d%H%M
    Set Global Variable    ${Date}
    Wait Until Keyword Succeeds    3x    15s    Click Element           ${crmsec_loc}
    Wait Until Keyword Succeeds    3x    15s    Click Element    ${leads_loc}
    Wait Until Element Is Visible    ${totalrecrds_loc}    30s