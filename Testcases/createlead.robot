*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ${CURDIR}/../Keywords/common.robot
Resource    ${CURDIR}/../Keywords/lead.robot

Test Setup   Run Keywords     Open Zoho CRM    AND     Login to Zoho CRM    ${username}    ${password}  AND  Navigate to Create Leads Section

Test Teardown    Close All Browsers

*** Test Cases ***
Verify Adding a New Lead in Zoho CRM 
    [Documentation]    Verify if a new lead can be added in Zoho CRM
    [Tags]    createlead_tc01   
    Add New Lead with only mandatory fields   
    Verify Lead is Added    


Verify User Cannot Add Record if Mandatory Fields Are Left Blank
    [Documentation]    Verify if a new lead cannot be added in Zoho CRM if mandatory fields are left blank
    [Tags]    createlead_tc02
    Leave all mandatory fields blank
    Verify Lead is not added



