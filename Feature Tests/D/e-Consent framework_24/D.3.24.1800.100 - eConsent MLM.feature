Feature: e-Consent Framework and PDF Snapshot: The system shall support the e-Consent Framework to display a consent form in a specific language.

 As a REDCap end user
 I want to see that eConsent is functioning as expected

    Scenario: D.3.24.1800.100 eConsent MLM
      #SETUP
      Given I successfully login to REDCap with the user "Test_Admin"
      And I create a new project named "D.3.24.1800.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button

      #SETUP_PRODUCTION
      Given I click on the link labeled "Project Setup"
      And I wait for another 3 seconds
      And I click on the button labeled "Move project to production"
      And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
      And I click on the button labeled "YES, Move to Production Status"
    Then I should see "Project status:  Production"

      #FUNCTIONAL REQUIREMENT
      ##ACTION: Open consent form in English
      When I click on the link labeled "Add / Edit Records"
      And I select "1 Tester 123" on the dropdown field labeled "Choose an existing Record ID"
      And I click the bubble to add a record for the "Screening" longitudinal instrument on event "Screening"
      And I enter "test@test.com" into the data entry form field labeled "Email Address for eConsent"
      And I select the radio option "English" for the field labeled "Preferred Language for Consent"
      And I select the radio option "Email invitation" for the field labeled "Preferred Contact Method"
      And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
      And I click the bubble to add a record for the "eConsent - ICF" longitudinal instrument on event "Screening"
      And I click on the button labeled "Survey options"
      And I click on the survey option label containing "Open survey" label
      ##VERIFY
      Then I should see "Consent example English"

      #FUNCTIONAL REQUIREMENT
      ##ACTION: Open consent form in Spanish
      Given I successfully login to REDCap with the user "Test_Admin"
      When I click on the link labeled "My Projects"
      And I click on the link labeled "D.3.24.1800.100"      
      And I click on the link labeled "Add / Edit Records"
      And I click on the button labeled "Add new record"
      And I click the bubble to add a record for the "Screening" longitudinal instrument on event "Screening"
      And I enter "test@test.com" into the data entry form field labeled "Email Address for eConsent"
      And I select the radio option "Spanish" for the field labeled "Preferred Language for Consent"
      And I select the radio option "Email invitation" for the field labeled "Preferred Contact Method"
      And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
      And I click the bubble to add a record for the "eConsent - ICF" longitudinal instrument on event "Screening"
      And I click on the button labeled "Survey options"
      And I click on the survey option label containing "Open survey" label
      ##VERIFY
      Then I should see "Ejemplo de consentimiento en español"
