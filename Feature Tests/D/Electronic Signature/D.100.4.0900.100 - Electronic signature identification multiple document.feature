Feature: Electronic Signature: The system shall require the user to confirm their intent to sign off on a document or data during the initial signing by entering their full electronic identity. For subsequent signings within a continuous signing session (covering multiple documents within a specified time frame), the system shall permit signing additional documents with only one identity component (typically a password), as the user's identity was fully verified during the initial signing. 

  As a REDCap end user
  I want to see that the system confirms electronic identification when signing multiple documents within a continuous session.

  Scenario: D.100.4.0900.100 Electronic signature identification multiple document
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.4.0900.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Customize & Manage Locking/E-signatures"
    And for the Column Name "Also display E-signature option on instrument?", I check the checkbox within the Record Locking Customization table for the Data Collection Instrument named "Attestation Data Entry"
    And for the Column Name "Also display E-signature option on instrument?", I check the checkbox within the Record Locking Customization table for the Data Collection Instrument named "Documentation of Informed Consent"
    And I click on the link labeled "Setup"
    And I wait for another 2 seconds
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status"
    Then I should see "Project status:  Production"

    #FUNCTIONAL REQUIREMENT
    ##ACTION E-sign a record
    When I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "1"
    And I click the bubble to add a record for the "Attestation Data Entry" longitudinal instrument on event "Screening"
    And I click on the button labeled "Today"
    And I enter "Paul Atreides" into the data entry form field labeled "Study Team Representative's Name"
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

    #FUNCTIONAL REQUIREMENT
    ##ACTION E-sign another form in same session
    When I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "1"
    And I click the bubble to add a record for the "Documentation of Informed Consent" longitudinal instrument on event "Screening"
    And I click on the link labeled "Add signature"
    And I draw a signature in the signature field area
    And I click on the button labeled "Save signature"
    And I check the checkbox labeled "Lock"
    And I check the checkbox labeled " E-signature"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    Then I should see "test_admin"
    And I enter the password "Testing123" for e-signature
    And I click on the button labeled "Save"
    Then I should see "E-signed by test_admin"
    And I should see "Instrument locked by test_admin"
#END
