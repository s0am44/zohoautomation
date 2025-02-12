**Zoho CRM Test Automation Framework**
This document outlines the test specification for the Zoho CRM Test Automation Framework, which is designed to automate the testing of Zoho CRM functionalities using Python, Robot Framework and SeleniumLibrary. The framework is structured to ensure maintainability, scalability, and ease of execution.

**Test Objectives**
The primary objectives of this test automation framework are:
To validate the functionality of Zoho CRM features related to lead management.
To ensure that the system behaves as expected when creating, editing, deleting, and filtering leads.
To verify that mandatory field validations are enforced during lead creation.
To ensure the framework is reusable, modular, and easy to maintain.

**Scope of Testing**
The scope of testing includes the following functionalities:
Lead Creation: Adding new leads with mandatory and optional fields.
Lead Editing: Modifying existing lead details.
Lead Deletion: Deleting existing leads and verifying cancellation scenarios.
Lead Filtering: Filtering leads based on specific criteria (e.g., lead name).
Validation: Ensuring mandatory field validations are enforced.

**Test Environment**
Software Requirements
Browser: Chrome, Firefox, or Edge (as specified during execution).
Automation Tools: Robot Framework, SeleniumLibrary.
Programming Language: Python.
Dependencies: locators.py, zohovariables.robot.

**Directory Structure**
Keywords/
    common.robot
    lead.robot
PageObject/
    __pycache__/
        locators.cpython-310.pyc
    locators.py
Resources/
    Variables/
        zohovariables.robot
Testcases/
    createlead.robot
    deletelead.robot
    editlead.robot
    filterlead.robot


**Directories and Files**
**Keywords**
common.robot: Contains common keywords used across multiple test cases, such as opening the Zoho CRM, logging in, and navigating to different sections.
lead.robot: Contains keywords specific to lead management, such as adding, editing, and deleting leads.
**PageObject**
locators.py: Contains the locators used in the test cases and keywords.
**Resources**
Variables/zohovariables.robot: Contains variables used throughout the test cases, such as URLs, usernames, and passwords.
**Testcases**
createlead.robot: Contains test cases for creating leads in Zoho CRM.
deletelead.robot: Contains test cases for deleting leads in Zoho CRM.
editlead.robot: Contains test cases for editing leads in Zoho CRM.
filterlead.robot: Contains test cases for filtering leads in Zoho CRM.
**Setup and Teardown**
Each test case file includes setup and teardown steps to ensure the browser is opened, logged in, and navigated to the appropriate section before each test, and closed after each test.

**Test Setup**
Test Setup   Run Keywords     Open Zoho CRM    AND     Login to Zoho CRM    ${username}    ${password}  AND  Navigate to leads section
**Test Teardown**
Test Teardown  Close All Browsers

**Running the Tests**
To run the tests, use the following command:
robot Testcases browser:Chrome
This will execute all the test cases in the Testcases directory.Browser attribute need to be changed as per need. 
E.g Firefox , Edge etc

**Keywords**
**Common Keywords**
Located in common.robot:

Open Zoho CRM: Opens the Zoho CRM login page.
Login to Zoho CRM: Logs into Zoho CRM using the provided username and password.
Navigate to Create Leads Section: Navigates to the create leads section.
Navigate to leads section: Navigates to the leads section.
Lead Keywords
Located in lead.robot:

Add New Lead with only mandatory fields: Adds a new lead with only mandatory fields.
Leave all mandatory fields blank: Attempts to add a lead with mandatory fields left blank.
Verify Lead is Added: Verifies that a lead has been added successfully.
Verify Lead is not added: Verifies that a lead has not been added.
Click on existing lead: Clicks on an existing lead.
Edit Lead: Edits the lead.
Edit Company name of the lead: Edits the company name of the lead.
Validate lead is edited successfully: Validates that the lead has been edited successfully.
Validate lead not is edited: Validates that the lead has not been edited.
Verify if lead deletion: Verifies if a lead has been deleted.

**Test Data**
**Variables**
**Located in zohovariables.robot:**
${zohourl}: URL for Zoho CRM login.
${browser}: Browser to be used for testing.
${Date}: Current date.
${lastname}: Last name for the lead.
${username}: Username for Zoho CRM login.
${password}: Password for Zoho CRM login.

**Locators**
**Located in locators.py:**
signin_loc: Locator for the sign-in element.
googlesign_loc: Locator for the Google sign-in element.


**Test Cases**
**Create Lead**

Located in createlead.robot:
Verify Adding a New Lead in Zoho CRM: Verifies if a new lead can be added in Zoho CRM.
Verify User Cannot Add Record if Mandatory Fields Are Left Blank: Verifies if a new lead cannot be added if mandatory fields are left blank.

**Delete Lead**
Located in deletelead.robot:
Verify user is able to delete existing lead: Verifies if a user can delete an existing lead.
Verify lead is not deleted if user cancels: Verifies if a lead is not deleted if the user cancels the deletion.

**Edit Lead**
Located in editlead.robot:
Verify User is able to edit lead details successfully: Verifies if a user can edit lead details successfully.
Verify lead is not edited if user cancels the edit: Verifies if a lead is not edited if the user cancels the edit.

**Filter Lead**
Located in filterlead.robot:
Verify user is able to filter bases on Lead Name: Verifies if a user can filter leads based on specific fields.

**Reasoning Behind Test Approach**

The test approach is designed to cover the core functionalities of Zoho CRM, focusing on lead management. The test cases are structured to validate the following scenarios:
1. **Create Lead**: Ensures that a new lead can be added with mandatory fields and verifies the behavior when mandatory fields are left blank.
2. **Delete Lead**: Validates the ability to delete an existing lead and checks the behavior when the deletion is canceled.
3. **Edit Lead**: Confirms that lead details can be edited successfully and verifies the behavior when the edit is canceled.
4. **Filter Lead**: Ensures that leads can be filtered based on specific criteria.


**Coverage Assessment**
The test cases provide comprehensive coverage of the lead management functionalities in Zoho CRM. By focusing on creating, deleting, editing, and filtering leads, the tests ensure that the critical operations related to lead management are thoroughly validated. This approach helps in identifying any issues or inconsistencies in the lead management process, ensuring a robust and reliable CRM system.


**Conclusion**
This test specification provides a comprehensive guide for executing automated tests for Zoho CRM functionalities. The framework is designed to be modular, reusable, and easy to maintain, ensuring efficient and reliable testing of lead management features.