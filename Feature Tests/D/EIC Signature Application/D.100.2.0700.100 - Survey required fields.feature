Feature: EIC Signature Application: The system should not allow the submission of a survey without all required fields completed.

  As a REDCap end user
  I want to see that the system does not allow submission of a survey without completing required fields.

  Scenario: D.100.2.0700.100 Survey required fields
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.2.0700.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status"
    Then I see Project status: "Production"
    
    #FUNCTIONAL REQUIREMENT
    ##VERIFY
    When I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "1"
    And I click the bubble to add a record for the "Screening" longitudinal instrument on event "Screening"
    And I enter "test@test.com" into the data entry form field labeled "Email Address for eConsent"
    And I select the radio option "English" for the field labeled "Preferred Language for Consent"
    And I select the radio option "Email invitation" for the field labeled "Preferred Contact Method"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    And I click the bubble to add a record for the "eConsent - ICF" longitudinal instrument on event "Screening"
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Log out+ Open survey" label
    Then I should see "Consent example English"

    #ACTION
    Given I click on the button labeled "Next Page >>"
    Then I should see "NOTE: Some fields are required!"
    And I should see "Your data was successfully saved, but you did not provide a value for some fields that require a value. Please enter a value for the fields on this page that are listed below."
    
    ##VERIFY
    Given I click on the button labeled "Okay"
    And I successfully login to REDCap with the user "Test_Admin"
    And I click on the link labeled "My Projects"
    And I click on the link labeled "D.100.2.0700.100"
    And I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "1"
    Then I should see the "Partial Survey Response" icon for the "eConsent - ICF" longitudinal instrument on event "Screening"
#END