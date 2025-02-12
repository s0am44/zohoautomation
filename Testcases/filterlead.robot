*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ${CURDIR}/../Keywords/common.robot
Resource    ${CURDIR}/../Keywords/lead.robot


Test Setup   Run Keywords     Open Zoho CRM    AND     Login to Zoho CRM    ${username}    ${password}  AND  Navigate to leads section
Test Teardown  Close All Browsers

*** Test Cases ***
Verify user is able to filter bases on Lead Name
    [Tags]    filterlead_tc01
    [Documentation]    Verify if user is able to filter leads based on specific fields like name staring with letter 'C' in this case
    Filter leads based on name field
    

