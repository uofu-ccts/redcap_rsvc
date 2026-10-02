Feature: EIC / EDC Core Requirements: The system shall allow for an Attestation as a survey and data entry interface.

  As a REDCap end user
  I want to see that the system allows attestation to be completed as a survey and data entry form.

  Scenario: D.100.2.0300.100 Attestation
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.2.0300.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    
    #FUNCTIONAL REQUIREMENT
    ##VERIFY
    When I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "1"
    And I click the bubble to add a record for the "Attestation Data Entry" longitudinal instrument on event "Screening"
    Then I should see "Statement by person witnessing consent"
    And I should see "Study Team Representative's Name"
    And I should see "Participant Full Name"
    And I should see "Study Team Representative's Signature"

    #ACTION
    Given I click on the button labeled "Today"
    And I check the checkbox labeled "Statement by person witnessing consent"
    And I enter "Kelsier" into the data entry form field labeled "Study Team Representative's Name"
    And I enter "Sazed" into the data entry form field labeled "Participant Full Name"
    And I click on the link labeled "Add signature"
    And I draw a signature in the signature field area
    And I click on the button labeled "Save signature"
    And I select "Complete" on the dropdown field labeled "Complete?"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    Then I should see "Record ID 1 successfully edited."
    And I should see the "Complete" icon for the "Attestation Data Entry" longitudinal instrument on event "Screening"

    #SETUP_SURVEY
    When I click on the link labeled "Designer"
    Then I click on the button labeled "Enable" in the row labeled "Attestation Data Entry"
    And I click on the button labeled "Save Changes"
    Then I should see "Your survey settings were successfully saved!"
   
    #ACTION
    Given I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    And I click the bubble to add a record for the "Attestation Data Entry" longitudinal instrument on event "Screening"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    And I click on the button labeled "Okay"
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Log out+ Open survey" label
    Then I should see "Statement by person witnessing consent"
    And I should see "Study Team Representative's Name"
    And I should see "Participant Full Name"
    And I should see "Study Team Representative's Signature"

    #ACTION
    Given I click on the button labeled "Today"
    And I check the checkbox labeled "Statement by person witnessing consent"
    And I enter "TenSoon" into the data entry form field labeled "Study Team Representative's Name"
    And I enter "OreSeur" into the data entry form field labeled "Participant Full Name"
    And I click on the link labeled "Add signature"
    And I draw a signature in the signature field area
    And I click on the button labeled "Save signature"
    And I click on the button labeled "Submit"
    Then I should see "Thank you for taking the survey."
    Given I successfully login to REDCap with the user "Test_Admin"
    And I click on the link labeled "My Projects"
    And I click on the link labeled "D.100.2.0300.100"
    And I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "2"
    Then I should see the "Completed Survey Response" icon for the "Attestation Data Entry" longitudinal instrument on event "Screening"
#END