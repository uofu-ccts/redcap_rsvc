Feature: The system shall support the ability for a participant to enter data in a data collection instrument enabled and distributed as a survey.

  As a REDCap end user
  I want to see that the participant can enter data into a survey

  Scenario: D.3.15.700.100 Distributed survey link functions in Survey mode
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.3.15.700.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I wait for another 2 seconds
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far"
    And I click on the button labeled "YES, Move to Production Status"
    Then I should see "Project status:  Production"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Open survey from participant list
    When I click on the link labeled "Survey Distribution Tools"
    And I click on the link labeled "Participant List"
    #Need a step definition for the 'link' below
    #And I click on the link in the column labeled "Link"
    #And I click on the link icon in the participant list
    And I click on the ".partLink" icon in the participant list
    Then I should see "Please complete the survey below."
    
    When I click on the button labeled "Submit"
    And I enter "test@test.com" into the input field labeled "Email Address for eConsent" 
    And I select the radio option "English" for the field labeled "Preferred Language for Consent"
    And I select the radio option "Email invitation" for the field labeled "Preferred Contact Method" 

    Given I click on the button labeled "Submit"
    Then I should see "Thank you for taking the survey."
    And I click on the button labeled "Close survey"

    #VERIFY_LOG
    Given I successfully login to REDCap with the user "Test_Admin"
    And I click on the link labeled "My Projects"
    And I click on the link labeled "D.3.15.700.100"
    When I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in the logging table:
      | Time / Date      | Username            | Action          |
      | mm/dd/yyyy hh:mm | [survey respondent] | Update Response |
#END