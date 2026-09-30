Feature: Data Comparison Tool / DDE Module: The system shall support the enabling/disabling of the Double Data Entry module. (Control Center).

  As a REDCap end user
  I want to see that the system allows enabling the double data entry module.

  Scenario: D.4.17.200.100 Enabling/Disabling DDE 
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.4.17.200.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the button labeled "Disable" in the row labeled "Use surveys in this project?" 
    And I wait for another 3 seconds
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far"
    And I click on the button labeled "YES, Move to Production Status"
    Then I should see "Project status:  Production"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Enable double data entry
    And I click on the link labeled "Edit Project Settings"
    And I select "Enabled" on the dropdown field labeled "Double Data Entry module"
    And I click on the button labeled "Save Changes"
    Then I should see "Your changes have been saved!"

    ##VERIFY
    When I click on the link labeled "D.4.17.200.100"
    And I click on the link labeled "User Rights"
    Then I should see "Double Data Entry"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Disable double data entry
    When I click on the link labeled "Project Setup"
    And I click on the link labeled "Edit Project Settings"
    And I select "Disabled" on the dropdown field labeled "Double Data Entry module"
    And I click on the button labeled "Save Changes"
    Then I should see "Your changes have been saved!"

    ##VERIFY
    When I click on the link labeled "D.4.17.200.100"
    And I click on the link labeled "User Rights"
    Then I should NOT see "Double Data Entry"
#END
