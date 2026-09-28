Feature: Manually add email to participant list: The system shall support the ability to manually add a participant to the participant list.

  As a REDCap end user
  I want to see that the participant list allows manual addition of a participant email.

  Scenario: D.3.15.600.100 Manually add email to participant list
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.3.15.600.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I wait for another 2 seconds
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status"
    Then I see Project status: "Production"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Add participant email through the participant list
    When I click on the link labeled "Survey Distribution Tools"
    And I click on the link labeled "Participant List"
    And I click on the button labeled "Add participants"
    And I enter "test@test.com" into the textarea field labeled "Add Emails to Participant List" 
    And I click on the button labeled "Add participants"##VERIFY
    Then I should see a dialog containing the following text: "PARTICIPANTS ADDED!" 
    And I should see "Email"
    And I should see "Record"
    And I should see "Participant Identifier"
    And I should see "Enable"
    And I should see "Responded?"
    And I should see "Invitation Scheduled?"
    And I should see "Invitation Sent?"
    And I should see "Link"
    And I should see "Survey Access Code"
    And I should see "test@test.com"
