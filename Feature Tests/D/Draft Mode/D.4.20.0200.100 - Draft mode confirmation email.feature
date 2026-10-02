Feature: Draft mode: The system shall allow for a confirmation email to be sent to the requestor which is templated but allows for additional information to be entered. 

  As a REDCap end user
  I want to see that the system allows a confirmation email to be sent with drafted changes in draft mode.

  Scenario: D.4.20.0200.100 Draft mode confirmation email 
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.4.20.0200.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far"
    And I click on the button labeled "YES, Move to Production Status"
    Then I should see "Project status:  Production"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Draft mode changes
    Given I click on the link labeled "Designer"
    And I click on the button labeled "Enter Draft Mode"
    Then I should see "The project is now in Draft Mode"

    Given I click on the link labeled "Designer"
    And I click on the link labeled "Prescreening"
    And I click on the Add Field input button below the field named "Record ID"
    And I select "Text Box (Short Text, Number, Date/Time, ...)" from the Field Type dropdown of the open "Add New Field" dialog box
    And I enter "Text Box" into the Field Label of the open "Add New Field" dialog box
    And I enter "textbox" into the Variable Name of the open "Add New Field" dialog box
    And I click on the button labeled "Save"

    #VERIFY
    Then I should see a field named "Text Box"

    When I click on the Edit image for the field named "Preferred Name"
    And I select "Yes - No" from the Field Type dropdown of the open "Edit Field" dialog box
    And I click on the button labeled "Save"
    And I click on the button labeled "Submit Changes for Review"
    And I click on the button labeled "Submit"
    And I click on the button labeled "Project Modification Module"
    And I click on the button labeled "Compose confirmation email"

    #VERIFY
    Then I should see "Compose confirmation email"
    And I should see "Below is a pre-filled confirmation email"
    And I should see "From:"
    And I should see "To:"
    And I should see "Subject:"
    And I should see the button labeled "Send Email"
    And I should see the button labeled "Cancel"
    And I click on the button labeled "Send Email"
    Then I should see "EMAIL SENT!"
#END
