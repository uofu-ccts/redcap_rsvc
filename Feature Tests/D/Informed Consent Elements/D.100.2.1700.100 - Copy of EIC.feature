Feature: Informed Consent Elements: A copy of the informed consent must be provided to the person signing the form (see 21 CFR 50.27(a))

  As a REDCap end user
  I want to see that the system allows a copy of the completed EIC to be sent to the participant.

  Scenario: D.100.2.1700.100 Copy of EIC
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.100.2.1700.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I wait for another 2 seconds
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status"
    Then I see Project status: "Production"
    
    #SETUP CONFIRMATION EMAIL
    Given I click on the button labeled "Disable" in the "Designate an email field for communications (including survey invitations and alerts)" row in the "Enable optional modules and customizations" section
    And I click on the button labeled "Undesignate field"
    And I wait for 1 second
    And I click on the link labeled "Designer"
    And I click on the "Survey settings" button for the instrument row labeled "eConsent - ICF"
    And I select "Yes" on the dropdown field labeled "Send confirmation email?"
    And I enter "EIC Copy" into the input field labeled "Subject"
    #There is something wrong with this step below, it works but seems to not actually register that anything was entered in Cypress? Must click into field for it to save
    And I enter "Attached is your completed eConsent" into the input field labeled "Send confirmation email?"
    And I check the checkbox labeled "Include PDF of completed survey as attachment"
    And I click on the button labeled "Save Changes"
    
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
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    And I click on the button labeled "Okay"
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Open survey" label
    Then I should see "Consent example English"

    #ACTION
    Given I click on the link labeled "Add signature"
    And I draw a signature in the signature field area
    And I click on the button labeled "Save signature"
    And I click on the button labeled "Next Page >>"
    And I check the checkbox labeled "I certify that all of my information in the document above is correct."
    And I click on the button labeled "Submit"
    Then I should see "Thank you for taking the survey."
    And I should see "Enter your email to receive confirmation message?"

    #FUNCTIONAL REQUIREMENT
    ##VERIFY
    Given I enter (my email) into the field with the placeholder text of "Enter email address"
    And I click on the button labeled "Send confirmation email"
    Then I should see "Email successfully sent!"
    Given I open the confirmation email
    Then I should see "Attached is your completed eConsent"
    And I should see a PDF attachment
#END