Feature: Data Comparison Tool / DDE Module: The system shall assign Reviewer rights to all users not designated as data entry person 1 or 2.

  As a REDCap end user
  I want to see that the system allows non-data entry users to be assigned Reviewer rights when using the double data entry module.

  Scenario: D.4.17.400.100 Assign Reviewer rights to non-data entry users
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.4.17.400.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the "Disable" button labeled "Use surveys in this project?" in the "Main project settings" section 
    And I click on the button labeled "Disable"
    And I wait for another 3 seconds
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status"
    Then I see Project status: "Production"

    ##ACTION: ENABLE DDE
    And I click on the link labeled "Edit Project Settings"
    And I select "Enabled" on the dropdown field labeled "Double Data Entry module"
    And I click on the button labeled "Save Changes"
    Then I see "Your changes have been saved!"

    #FUNCTIONAL REQUIREMENT    
    ##ACTION: ADD DATA ENTRY PERSONS
    When I click on the link labeled "D.4.17.400.100"
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
    And I click on the button labeled "Add user"
    Then I should see "Test User4"
    
    #VERIFY 
    Then I should see a "DDE Person #1" within the "test_user2 (Test User2)" row of the column labeled "Double Data Entry" of the User Rights table
    And I should see a "DDE Person #2" within the "test_user3 (Test User3)" row of the column labeled "Double Data Entry" of the User Rights table
    And I should see a "Reviewer" within the "test_user4 (Test User4)" row of the column labeled "Double Data Entry" of the User Rights table
#END