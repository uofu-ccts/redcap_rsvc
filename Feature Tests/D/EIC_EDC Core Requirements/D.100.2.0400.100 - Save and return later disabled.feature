Feature: EIC / EDC Core Requirements: By default, the 'Save and return later' functionality is disabled and not available.

  As a REDCap end user
  I want to see that the system by default has disabled the 'Save and return later' functionality on surveys.

  Scenario: D.100.2.0400.100 Save and return later disabled
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.2.0400.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    
    #FUNCTIONAL REQUIREMENT
    ##VERIFY
    When I click on the link labeled "Designer" 
    And I click on the button labeled "Survey settings" in the row labeled "eConsent - ICF"
    Then I should see the dropdown field labeled "Allow 'Save & Return Later' option for respondents?" with the option "No" selected
    And I click on the button labeled "Cancel"

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
    And I should NOT see "Save & Return Later"
#END