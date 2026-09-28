Feature: Logging Module: Email Logging Module shall provide the ability to search/filter

  As a REDCap end user
  I want to see that the email logging module provides the ability to search/filter by multiple criteria.

  Scenario: D.2.23.500.100 Email logging module search/filter
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.2.23.500.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status"
    Then I should see "Project status:  Production"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: View email logging
    When I click on the link labeled "Email Logging"
    And I click on the button labeled "I understand and agree"

    ##VERIFY
    Then I should see "Search all outgoing emails for this project" 
    And I should see the dropdown field labeled "in" with the options below 
      | Subject, body, sender, and recipient                |
      | Subject and body                                    |
      | Subject only                                        |
      | Body only                                           |
      | Sender and recipient                                |
      | Sender only                                         |
      | Recipient only                                      |
    And I should see the dropdown field labeled "Type:" with the options below 
      | -- all types --                                     |
      | Survey Invitations (all types)                      |
      | - Survey Invitations (only manually sent/scheduled) |
      | - Survey Invitations (only ASIs)                    |
      | Alerts & Notifications                              |
    And I should see the dropdown field labeled "Pertaining to a specific record:" with the options below 
      | All records     |
      | 1 Tester 123    |
    And I should see "Search within a window of time from" 
