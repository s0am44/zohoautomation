*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ${CURDIR}/../Keywords/common.robot
Resource    ${CURDIR}/../Keywords/lead.robot


Test Setup   Run Keywords     Open Zoho CRM    AND     Login to Zoho CRM    ${username}    ${password}  AND  Navigate to leads section
Test Teardown  Close All Browsers

*** Test Cases ***

Verify user is able to delete existing lead
    [Documentation]    Verify if user is able to delete an existing lead
    [Tags]    deletelead_tc01
    Verify if lead deletion    ${Accept}


Verify lead is not deleted if user cancels 
    [Tags]    deletelead_tc02
    [Documentation]    Verify if lead is not deleted if user cancels
    Verify if lead deletion    ${Reject}
    