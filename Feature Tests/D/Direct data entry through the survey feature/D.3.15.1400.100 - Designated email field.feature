Feature: Direct data entry through the survey feature: The system shall allow creation of a designated email field. 

  As a REDCap end user
  I want to see that the system allows an email field to be designated in a project.

  Scenario: D.3.15.1400.100 Designated email field
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.3.15.1400.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I wait for another 2 seconds
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status"
    Then I should see "Project status:  Production"

    #ACTION
    #Disable and enable designated email field in project setup
    When I click on the button labeled "Disable" in the "Designate an email field for communications (including survey invitations and alerts)" row in the "Enable optional modules and customizations" section
    And I click on the button labeled "Undesignate field"
    When I click on the button labeled "Enable" in the "Designate an email field for communications (including survey invitations and alerts)" row in the "Enable optional modules and customizations" section
    And I select "email_address" on the dropdown field labeled "-- select a field --"
    And I click on the button labeled "Save"

    #VERIFY
    Then I should see "Field currently designated: email_address"

    #ACTION
    #Enable designated email field in survey settings
    Given I click on the link labeled "Designer"
    And I click on the button labeled "Survey settings"
    And I select "email_address" on the dropdown field labeled "Survey-specific email invitation field"
    And I click on the button labeled "Save Changes"

    #VERIFY
    Given I click on the button labeled "Survey settings"
    Then I should see "email_address"

#END
