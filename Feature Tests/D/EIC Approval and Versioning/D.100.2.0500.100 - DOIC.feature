Feature: EIC Approval and Versioning: The System shall allow the approved version of EIC will be made available for use on the project/study.

  As a REDCap end user
  I want to see that the system allows an approved EIC version to be available and documented in a project.

  Scenario: D.100.2.0500.100 DOIC
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.2.0500.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status"
    Then I see Project status: "Production"
    
    #FUNCTIONAL REQUIREMENT
    ##VERIFY
    When I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "1"
    And I click the bubble to add a record for the "Documentation of Informed Consent" longitudinal instrument on event "Screening"
    Then I should see "Subject Initials:"
    And I should see "IRB Approval Date:"
    And I should see "Date Subject/LAR signed:"
    And I should see "Please select the applicable consent(s) for this participant and populate the version name/number for each:"
    And I should see "Is this the most recent version of the IRB approved Informed Consent / Assent / Permission?"
    And I should see "First Name of person obtaining consent:"
    And I should see "Last Name of person obtaining consent:"
    And I should see "Person obtaining consent should intitial next to each line to indicate completion of each task:"
    And I should see "Signature of person obtaining consent:"
    And I should see "Date person obtained consent:"

    #ACTION
    Given I enter "EP" into the data entry form field labeled "Subject Initials:"
    And I enter "01-01-2001" into the data entry form field labeled "IRB Approval Date:"
    And I enter "01-01-2001" into the data entry form field labeled "Date Subject/LAR signed:"
    And I select the checkbox option "Consent" for the field labeled "Please select the applicable consent(s) for this participant and populate the version name/number for each:"
    And I enter "V1" into the data entry form field labeled "Consent Version/name"
    And I select the radio option "Yes" for the field labeled "Is this the most recent version of the IRB approved Informed Consent / Assent / Permission?" 
    And I enter "Straff" into the data entry form field labeled "First Name of person obtaining consent:"
    And I enter "Venture" into the data entry form field labeled "Last Name of person obtaining consent:"
    And I enter "SV" into the data entry form field labeled "The informed consent form was signed before any reseach procedure were performed above and beyond routine stand of care (Initials):"
    And I enter "SV" into the data entry form field labeled "The participant was given the opportunity to read the consent and ask questions (Initials):"
    And I enter "SV" into the data entry form field labeled "The participant was consented in his/her primiary language (Initials):"
    And I enter "SV" into the data entry form field labeled "The participant verbalized understanding of the informed consent information (Initials):"
    And I enter "SV" into the data entry form field labeled "A copy of the signed consent form was given to the paricipant (Initials):"
    And I check the checkbox labeled "N/A"
    And I click on the link labeled "Add signature"
    And I draw a signature in the signature field area
    And I click on the button labeled "Save signature"
    And I enter "01-01-2001" into the data entry form field labeled "Date person obtained consent:"
    And I select "Complete" on the dropdown field labeled "Complete?"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    Then I should see "Record ID 1 successfully edited."
    And I should see the "Complete" icon for the "Documentation of Informed Consent" longitudinal instrument on event "Screening"
#END