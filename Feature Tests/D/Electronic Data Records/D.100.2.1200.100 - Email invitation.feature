Feature: Electronic Data Records: Email shall automatically be sent to the participant when the 'send email to participant' button is clicked within the send invitations functionality.

  As a REDCap end user
  I want to see that the survey will be automatically emailed to the participant when a survey invitation is sent.

  Scenario: D.100.2.1200.100 Email invitation
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.2.1200.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status"
    Then I see Project status: "Production"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Add participant email through the participant list
    When I click on the link labeled "Survey Distribution Tools"
    And I click on the link labeled "Participant List"
    And I click on the button labeled "Add participants"
    And I enter (my email) into the textarea field labeled "Add Emails to Participant List" 
    And I click on the button labeled "Add participants"##VERIFY
    Then I should see a dialog containing the following text: "PARTICIPANTS ADDED!" 

    #FUNCTIONAL REQUIREMENT
    ##ACTION
    Given I click on the button labeled "Compose Survey Invitations"
    And I click on the button labeled "Send Invitations"
    Then I should see "Your emails are being sent"
    
    ##VERIFY
    Given I click on the button labeled "Close"
    And I open the survey link in my email
    Then I should see "Prescreening"
    And I should see "Please complete the survey below."
#END