Feature: Logging Module: Email Logging Module shall record outgoing emails

  As a REDCap end user
  I want to see that the email logging module provides the ability to view outgoing email details.

  Scenario: D.2.23.600.100 Email logging module view sent emails
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.2.23.600.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status"
    Then I see Project status: "Production"

    #SEND_EMAIL
    When I click on the link labeled "Alerts & Notifications"
    And I click on the button labeled "Re-evaluate Alerts"
    And I click on the button labeled "Re-evaluate selected alerts"
    And I click on the button labeled "OK"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: View email logging results
    When I click on the link labeled "Email Logging"
    And I click on the button labeled "I understand and agree"
    And I select "Alerts & Notifications" on the dropdown field labeled "Type:" 
    And I click on the button labeled "Search emails"

    ##VERIFY
    Then I should see "1 matching results"
    And I should see "View msg"
    And I should see "Time sent" 
    And I should see "Record"
    And I should see "Summary email content and attributes" 
    And I should see "1"
    And I should see "From: test_admin@test.edu, To: ashley.oconnor@utah.edu"
    And I should see "Subject: A participant has completed the prescreening survey"
