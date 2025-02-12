*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ${CURDIR}/../Keywords/common.robot
Resource    ${CURDIR}/../Keywords/lead.robot


Test Setup   Run Keywords     Open Zoho CRM    AND     Login to Zoho CRM    ${username}    ${password}  AND  Navigate to leads section
Test Teardown  Close All Browsers

*** Test Cases ***

Verify User is able to edit lead details successfully
    [Documentation]    Verify if user is able to edit lead details successfully
    [Tags]    editlead_tc_01   
    Click on existing lead  
    Edit Lead 
    Edit Company name of the lead    ${Save}
    Validate lead is edited successfully


Verify lead is not edited if user cancels the edit
    [Documentation]    Verify if lead is not edited if user cancels the edit
    [Tags]    editlead_tc_02  
    Click on existing lead   
    Edit Lead
    Edit Company name of the lead    ${Cancel}
    Validate lead not is edited
    