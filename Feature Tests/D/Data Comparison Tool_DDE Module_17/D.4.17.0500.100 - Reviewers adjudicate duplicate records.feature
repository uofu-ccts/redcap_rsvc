Feature: Data Comparison Tool / DDE Module: The system shall allow Reviewers to view and adjudicate the differences between duplicate records.

  As a REDCap end user
  I want to see that the system allows users with the reviewer role in the double data entry module to adjudicate differences between duplicate records.

  Scenario: D.4.17.500.100 Reviewers adjudicate duplicate records
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.4.17.500.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the "Disable" button labeled "Use surveys in this project?" in the "Main project settings" section 
    And I click on the button labeled "Disable"
    And I wait for another 3 seconds
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far"
    And I click on the button labeled "YES, Move to Production Status"
    Then I should see "Project status:  Production"

    ##ACTION: ENABLE DDE
    And I click on the link labeled "Edit Project Settings"
    And I select "Enabled" on the dropdown field labeled "Double Data Entry module"
    And I click on the button labeled "Save Changes"
    Then I see "Your changes have been saved!"

    #REDUNDANT - D.4.17.0400.100   
    ##ACTION: ADD DATA ENTRY PERSONS
    When  I click on the link labeled "D.4.17.500.100"
    And I click on the link labeled "User Rights"
    And I enter "Test_User2" into the field with the placeholder text of "Add new user"
    And I click on the button labeled "Add with custom rights"
    And I select the User Right named "Double Data Entry" and choose "Person #1" 
    And I click on the button labeled "Add user"
    Then I should see "Test User2"

    When I click on the link labeled "User Rights"
    And I enter "Test_User3" into the field with the placeholder text of "Add new user"
    And I click on the button labeled "Add with custom rights"
    And I select the User Right named "Double Data Entry" and choose "Person #2" 
    And I click on the button labeled "Add user"
    Then I should see "Test User3"

    When I click on the link labeled "User Rights"
    And I enter "Test_User4" into the field with the placeholder text of "Add new user"
    And I click on the button labeled "Add with custom rights"
    And I check the User Right named "Data Comparison Tool"
    And I click on the button labeled "Add user"
    Then I should see "Test User4"
    
    #FUNCTIONAL REQUIREMENT 
    #REDUNDANT - D.4.17.0300.100   
    ##ACTION: ADD RECORD AS TEST USER2
    Given I successfully login to REDCap with the user "Test_User2"
    And I click on the link labeled "My Projects"
    And I click on the link labeled "D.4.17.500.100"
    And I click on the link labeled "Record Status Dashboard"
    And I enter "2" into the field with the placeholder text of "Enter new record name" 
    And I click on the button labeled "Create"
    And I wait for another 2 seconds
    And I click the bubble to add a record for the "Prescreening" longitudinal instrument on event "Screening"
    And I enter "test@test.com" into the input field labeled "Please provide your email address:"
    And I enter "Jon Snow" into the input field labeled "Preferred Name"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    Then I see "Record ID 2 successfully added."
    And I logout

    #FUNCTIONAL REQUIREMENT
    ##ACTION: VIEW RECORDS AS TEST USER3
    Given I successfully login to REDCap with the user "Test_User3"
    And I click on the link labeled "My Projects"
    And I click on the link labeled "D.4.17.500.100"
    And I click on the link labeled "Record Status Dashboard"
    Then I should NOT see "Jon Snow"

    ##ACTION: ADD RECORD AS TEST USER3
    And I enter "2" into the field with the placeholder text of "Enter new record name" 
    And I click on the button labeled "Create"
    And I wait for another 2 seconds
    And I click the bubble to add a record for the "Prescreening" longitudinal instrument on event "Screening"
    And I enter "error@test.com" into the input field labeled "Please provide your email address:"
    And I enter "Jon Snow" into the input field labeled "Preferred Name"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    Then I see "Record ID 2 successfully added."
    And I logout

    #FUNCTIONAL REQUIREMENT
    ##ACTION: AJUDICATE RECORDS AS TEST USER4
    Given I successfully login to REDCap with the user "Test_User4"
    And I click on the link labeled "My Projects"
    And I click on the link labeled "D.4.17.500.100"
    And I click on the link labeled "Data Comparison Tool"
    And I select "2 - Screening" on the dropdown field labeled "--- Choose a record ---"
    And I wait for another 2 seconds
    And I click on the input button labeled "Compare selected record"

    ##VERIFY
    Then I should see "Differences were found between the two records"
    And I should see "Label (field name)"
    And I should see "Form Name"
    And I should see "Record ID"
    And I should see "2--1"
    And I should see "2--2"
    And I should see "Screening"
    And I should see "Please provide your email address: (email_address)"
    And I should see "Prescreening"
    And I should see "test@test.com"
    And I should see "error@test.com"
#END
