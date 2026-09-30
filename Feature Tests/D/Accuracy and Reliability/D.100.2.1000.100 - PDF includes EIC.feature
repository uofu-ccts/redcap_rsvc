Feature: Accuracy and Reliability: The first pages of the printable pdf shall include: Embedded images of the EIC

  As a REDCap end user
  I want to see that the system allows the completed EIC PDF to contain embedded images of the EIC form.

  Scenario: D.100.2.1000.100 PDF includes EIC
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.2.1000.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
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

    #FUNCTIONAL REQUIREMENT
    ##VERIFY
    And I wait for another 5 seconds
    Then I should see the consent pdf has loaded in the iframe
    Then I should see "Consent example English" 
#END
