Feature: EIC / EDC Core Requirements: An IRB-approved EIC project form will be provided electronically and/or in paper/static format for consenting.

  As a REDCap end user
  I want to see that the system allows an IRB-approved EIC form to be added to the project electronically or uploaded from a paper format.

  Scenario: D.100.2.0200.100 EIC form
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.2.0200.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far"
    And I click on the button labeled "YES, Move to Production Status"
    Then I should see "Project status:  Production"
    
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
    Given I click on the link labeled "Add signature"
    And I draw a signature in the signature field area
    And I click on the button labeled "Save signature"
    And I click on the button labeled "Next Page >>"
    And I check the checkbox labeled "I certify that all of my information in the document above is correct."
    And I click on the button labeled "Submit"
    Then I should see "Thank you for taking the survey."
    Given I successfully login to REDCap with the user "Test_Admin"
    And I click on the link labeled "My Projects"
    And I click on the link labeled "D.100.2.0200.100"
    And I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "1"
    Then I should see the "Completed Survey Response" icon for the "eConsent - ICF" longitudinal instrument on event "Screening"

    #FUNCTIONAL REQUIREMENT
    ##VERIFY
    Given I click the bubble to add a record for the "Manual Consent Upload" longitudinal instrument on event "Screening"
    Then I should see "Upload copy of signed consent"

    #ACTION
    And I enter "Elend" into the data entry form field labeled "First Name"
    And I enter "Venture" into the data entry form field labeled "Last Name"
    And I enter "02-02-2003" into the data entry form field labeled "Participant Date of Birth"
    And I click on the link labeled "Upload file"
    And I upload a "docx" format file located at "import_files/File_Upload.docx", by clicking the button near "Upload file" to browse for the file, and clicking the button labeled "Upload file" to upload the file
    And I wait for 2 seconds
    And I click on the link labeled "Add signature"
    And I draw a signature in the signature field area
    And I click on the button labeled "Save signature"
    And I select "Complete" on the dropdown field labeled "Complete?"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    Then I should see "Record ID 1 successfully edited."
    And I should see the "Complete" icon for the "Manual Consent Upload" longitudinal instrument on event "Screening"
#END
