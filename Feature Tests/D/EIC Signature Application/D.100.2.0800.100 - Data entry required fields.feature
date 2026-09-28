Feature: EIC Signature Application: The system shall allow a user to save a survey with required fields not filled out in data entry mode.

  As a REDCap end user
  I want to see that the system allows users to save surveys with missing required fields when completed as a data entry form.

  Scenario: D.100.2.0800.100 Data entry required fields
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.2.0800.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status"
    Then I should see "Project status:  Production"
    
    #FUNCTIONAL REQUIREMENT
    ##VERIFY
    When I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "1"
    And I click the bubble to add a record for the "eConsent - ICF" longitudinal instrument on event "Screening"
    Then I should see "Consent example English"

    #ACTION
    Given I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    Then I should see "NOTE: Some fields are required!"
    And I should see "Your data was successfully saved, but you did not provide a value for some fields that require a value. Please enter a value for the fields on this page that are listed below."
    And I should see "Okay"
    And I should see "Ignore and leave record"
    And I should see "Ignore and go to next form"

    ##VERIFY
    Given I click on the button labeled "Ignore and leave record"
    Then I should see the "Incomplete" icon for the "eConsent - ICF" longitudinal instrument on event "Screening"
#END
