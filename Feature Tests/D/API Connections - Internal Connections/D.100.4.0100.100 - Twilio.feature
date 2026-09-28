Feature: API Connections / Internal Connections: The system shall allow the use of Twilio to send SMS 

As a REDCap end user
I want to see that the system allows for the use of Twilio.
#This feature is to be run completely MANUALLY on the REDCap Shadow instance

Scenario: D.100.4.0100.100 Twilio
    #SETUP
    Given I login to REDCap Shadow with an Admin account
    And I create a new project named "D.100.4.0100.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICTwilioMosioCanonicalProject.xml", and clicking the "Create Project" button

    #SETUP_TWILIO
    Given I click on the button labeled "Enable" in the "Twilio SMS and Voice Call services for surveys and alerts" row in the "Enable optional modules and customizations" section
    And I select "Enabled" on the dropdown field labeled "Twilio SMS and Voice Call services" 
    And I enter (the SID) into the input field labeled "Twilio Account SID" 
    And I enter (the Auth Token) into the input field labeled "Twilio Auth Token" 
    And I enter (the phone number) into the input field labeled "Twilio phone number" 
    And I click on the button labeled "Save"
    Then I should see "Twilio SMS and Voice Call services have been successfully enabled!"

    Given I click on the button labeled "Configure settings" in the "Twilio SMS and Voice Call services" section
    And I select the checkbox option "Send survey invitation with survey link via SMS" on the field labeled "Choose Survey invitation Type to use"
    And I select "SMS invitation" on the dropdown field labeled "Choose the default invitation preference for new survey participants" 
    And I select "twilio_mail \"Would you prefer to receive surveys via email or phone?\"" on the dropdown field labeled "Control each participant's invitation preference using a multiple choice field"
    And I select "cell \"Please enter your cell phone number\"" on the dropdown field labeled "Designate a phone number field for survey invitations sent via SMS or voice call (optional)"
    And I click on the button labeled "Save"
    Then I should see "Success! Your changes have been saved."

    Given I click on the link labeled "Designer"
    And I click on the button labeled "Automated Invitations" for the instrument named "Visit preference" 
    And I click on the radio labeled "Active" 
    And I select "Use participant\'s preference" on the drop down field labeled "STEP 1: Invitation type – How the participant is invited"
    And I click on the button labeled "Save"
    Then I should see "Settings for automated invitations were successfully saved!"
    And I click on the button labeled "Close"#FUNCTIONAL REQUIREMENT
    ##ACTION: Send an SMS message
    Given I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    And I click the bubble to add a record for the "Demographics" instrument
    And I enter (my email) into the input field labeled "email" 
    And I enter (my phone number) into the input field labeled "Please enter your cell phone number"
    And I select the radio option "Yes" for the field labeled "Do you permit us to send text messages to your phone?"
    And I select the radio option "SMS invitation (contains survey link)" for the field labeled "Would you prefer to receive surveys via email or phone?"
    And I click on the button labeled "Today"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    ##VERIFY
    Then I should see "Record ID 1 successfully added"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: View SMS Logging
    Given I click on the link labeled "Email & SMS Logging"
    And I click on the button labeled "I understand and agree"
    And I click on the button labeled "Search emails and SMS messages"
    Then I should see "1 matching results"
    And I should see a table header and row containing the following values in the "Email & SMS Logging" table:
    | View msg | Time sent        | Record | Summary email content and attributes                        |
    |          | mm/dd/yyyy hh:mm | 1      | From: (Twilio phone number), To: (my phone number)          |
    
    Given I click on the message icon
    Then I should see "SMS"
    And I should see "From: (Twilio phone number)"
    And I should see "To: (my phone number)"
    And I should see "Please take this survey.  It is an example of how a survey is distributed via SMS Texting to a person's phone"
    And I should see "You may open the survey in your web browser by clicking the link below:"
#END


