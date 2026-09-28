Feature: Informed Consent Elements: Compliance with the requirements in Part 11 is meant to prevent fraudulent use. Therefore, the regulations found at 21 CFR part 11 require that an organization verify an individual's identity before it establishes, assigns, certifies, or otherwise sanctions an individual's electronic signature or any element of such electronic signature (see 21 CFR 11.100(b)). 

  As a REDCap end user
  I want to see that the system confirms electronic identification when signing electronically.

  Scenario: D.100.4.1100.100 Electronic signature identity verification 
    #FUNCTIONAL REQUIREMENT
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.4.1100.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Customize & Manage Locking/E-signatures"
    Then I should see "Customize and Manage the Record Locking and E-signature Functionality"
    And for the Column Name "Also display E-signature option on instrument?", I check the checkbox within the Record Locking Customization table for the Data Collection Instrument named "Attestation Data Entry"
    And I click on the link labeled "Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status"
    Then I should see "Project status:  Production"


    ##VERIFY
    When I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "1"
    And I click the bubble to add a record for the "Attestation Data Entry" longitudinal instrument on event "Screening"
    And I click on the button labeled "Today"
    And I enter "Chani Kynes" into the data entry form field labeled "Study Team Representative's Name"
    And I click on the link labeled "Add signature"
    And I draw a signature in the signature field area
    And I click on the button labeled "Save signature"
    And I check the checkbox labeled "Lock"
    And I check the checkbox labeled " E-signature"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    And I enter the Username: "Test_Admin" and password "Testing123" for e-signature
    And I click on the button labeled "Save"
    Then I should see "E-signed by test_admin"
    And I should see "Instrument locked by test_admin"
#END
