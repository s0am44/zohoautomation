*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    DateTime
Variables     ${CURDIR}/../PageObject/locators.py
Resource       ${CURDIR}/../Resources/Variables/zohovariables.robot

*** Keywords ***
Add New Lead with only mandatory fields
    [Documentation]    Add a new lead with only mandatory fields and save
    Input Text     ${companyname_loc}    lead${Date}
    Input Text     ${lastname_loc}    ${lastname}${Date}
    Click Element   ${saveleadbtn_loc}

Leave all mandatory fields blank
    [Documentation]    Leave all mandatory fields blank and save
    Input Text    ${title_loc}    lead${Date}
    Click Element   ${saveleadbtn_loc}


Verify Lead is Added
    [Documentation]    Verify if the lead is added successfully
    Wait Until Page Contains Element   //span[contains(text(),'${lastname}${Date}')]    15s
    Log    Lead ${lastname}${Date} successfully added to Zoho CRM

Verify Lead is not added
    [Documentation]    Verify if the lead is not added successfully
    Wait Until Page Contains Element   ${leaderrmsg_loc}    15s
    Log    Lead ${lastname}${Date} was not added to Zoho CRM


Click on existing lead
    [Documentation]    Click on an existing lead
    Click Element    ${leadtable_loc}
    Wait Until Page Contains Element     ${leadedit_loc}     15s


Edit Lead
    [Documentation]    Edit the lead
    Click Element      ${leadedit_loc}
    

Edit Company name of the lead
    [Documentation]    Edit the company name of the lead
    [Arguments]    ${setting}
    Wait Until Element Is Visible     ${companynameedit_loc}     15s
    Clear Element Text       ${companynameedit_loc}
    Click Element     ${companynameedit_loc}
    Input Text        ${companynameedit_loc}    NewCompany${Date}
    IF    '${setting}'=='Save'
        Click Element    ${saveleadbtn_loc}
    ELSE
        Click Element    ${cancelbtn_loc}
    
    END
    



Validate lead is edited successfully
    [Documentation]    Validate if the lead is edited successfully
    Wait Until Page Contains     NewCompany${Date}    timeout=15s

Validate lead not is edited
    [Documentation]    Validate if the lead is not edited
    Wait Until Page Does Not Contain     NewCompany${Date}    timeout=15s


Verify if lead deletion
    [Documentation]    Verify if lead is deleted
    [Arguments]  ${setting}
    Click on existing lead
    ${leadname}=    Get Text    ${existingleadnm_loc}
    Wait Until Element Is Visible     ${moreoptions_loc}    timeout=15
    Click Element    ${moreoptions_loc}
    Sleep    5
    Click Element    ${delete_loc}
    Wait Until Element Is Visible      ${accept_loc}    timeout=10
    IF     '${setting}'=='Accept'
        Click Element    ${accept_loc}
        Wait Until Page Does Not Contain    ${leadname}    timeout=30s
    ELSE
        Click Element    ${reject_loc}
        Page Should Contain    ${leadname}    
    END


Filter leads based on name field
    [Documentation]    Filter leads based on name field , for example 'C' pass the value in "searchtxt". It should return value starting with 'C'
    @{actuallist}=    Get WebElements    ${leadbody_loc}
    Click Element      ${search_loc}
    Sleep    2
    Click Element     ${searchc_loc}
    Sleep   5
    @{filterlist}=    Get WebElements    ${leadbody_loc}    

    FOR    ${element}    IN    @{filterlist}
        ${text}=    Get Text    ${element}
        Should Start With    ${text}    ${searchtxt} 
    END


    