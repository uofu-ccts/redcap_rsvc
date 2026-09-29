Feature: Post Signature Form Actions: The system shall be able to complete the attestation form after the participant has completed the EIC.

  As a REDCap end user
  I want to see that the system allows for the attestation form to be completed after a participant has completed the EIC.

  Scenario: D.100.2.0900.100 Attestation after EIC
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.2.0900.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far"
    And I click on the button labeled "YES, Move to Production Status"
    Then I should see "Project status:  Production"
    
    #ACTION
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
    And I click on the link labeled "Add signature"
    And I draw a signature in the signature field area
    And I click on the button labeled "Save signature"
    And I click on the button labeled "Next Page >>"
    And I check the checkbox labeled "I certify that all of my information in the document above is correct."
    And I click on the button labeled "Submit"
    Then I should see "Thank you for taking the survey."

    #FUNCTIONAL REQUIREMENT
    ##VERIFY
    Given I successfully login to REDCap with the user "Test_Admin"
    And I click on the link labeled "My Projects"
    And I click on the link labeled "D.100.2.0900.100"
    And I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "1"
    Then I should see the "Completed Survey Response" icon for the "eConsent - ICF" longitudinal instrument on event "Screening"

    #ACTION
    Given I click the bubble to add a record for the "Attestation Data Entry" longitudinal instrument on event "Screening"
    And I click on the button labeled "Today"
    And I check the checkbox labeled "Statement by person witnessing consent"
    And I enter "Hammond" into the data entry form field labeled "Study Team Representative's Name"
    And I enter "Marsh" into the data entry form field labeled "Participant Full Name"
    And I click on the link labeled "Add signature"
    And I draw a signature in the signature field area
    And I click on the button labeled "Save signature"
    And I select "Complete" on the dropdown field labeled "Complete?"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    #FUNCTIONAL REQUIREMENT
    ##VERIFY
    Then I should see "Record ID 1 successfully edited."
    And I should see the "Complete" icon for the "Attestation Data Entry" longitudinal instrument on event "Screening"
#END
