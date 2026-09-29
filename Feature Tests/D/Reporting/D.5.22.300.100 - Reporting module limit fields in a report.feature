Feature: Reporting: The system shall support the ability to limit fields included in a report.

  As a REDCap end user
  I want to see that Reporting is functioning as expected

  Scenario: D.5.22.300.100 Reporting module limit fields in a report 
    #SETUP
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.5.22.300.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button

    #SETUP_PRODUCTION
    When I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far"
    And I wait for another 2 seconds
    And I click on the button labeled "YES, Move to Production Status"
    Then I should see "Project status:  Production"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION:  create report
    When I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Create New Report"
    And I enter "D.5.22.300.100 REPORT" into the input field labeled "Name of Report:"
    And I click on the button labeled "Save Report"
    Then I should see "Your report has been saved!"
    And I wait for another 2 seconds

    ##VERIFY: saved name
    When I click on the button labeled "View report"
    Then I should see "D.5.22.300.100 REPORT"

    When I click on the button labeled "Edit Report"
    Then I should see "Edit Existing Report:"
    And I should see "D.5.22.300.100 REPORT"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION:  edit report name
    When I clear field and enter "D.5.22.300.100 REPORT_EDIT" into the input field labeled "Name of Report:"
    And I click on the button labeled "Save Report"
    Then I should see "Your report has been saved!"
    And I wait for another 2 seconds

    ##VERIFY: edited name
    When I click on the button labeled "View report"
    Then I should see "D.5.22.300.100 REPORT_EDIT"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION:  edit report description
    When I click on the button labeled "Edit Report"
    Then I should see "Edit Existing Report:"
    And I should see "D.5.22.300.100 REPORT_EDIT"
    And I enter "Test description" into the field identified by "textarea#description" labeled "Description (optional):"
    And I click on the button labeled "Save Report"
    Then I should see "Your report has been saved!"
    And I wait for another 2 seconds

    ##VERIFY: edited description
    When I click on the button labeled "View report"
    Then I should see "Test description"

    #FUNCTIONAL_REQUIREMENT
    #REDUNDANT - C.5.22.100.100
    ##ACTION:  edit report user access
    When I click on the button labeled "Edit Report"
    Then I should see "Edit Existing Report:"
    And I should see "D.5.22.300.100 REPORT_EDIT"
    And I select the radio option "Custom user access" for the field labeled "View Access" 
    Then I should see "Selected users"
    And I should see "test_admin (Admin User)"
    And I should see "Selected user roles"
    And I should see "Administrator"
    And I should see "Auditor / Monitor"
    And I should see "Data Entry Analyst"
    And I should see "Principle Investigator"
    And I should see "Study Coordinator"
    And I should see "Selected DAGs"
    And I should see "Arizona"
    And I should see "Nevada"
    And I should see "Utah"
    And I click on the link labeled "Cancel"
    And I click on the button labeled "Edit Report"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION:  edit fields included
    When I click on the field labeled "Field 2"
    And I enter "prefname" into the field identified by "input.x-form-text.x-form-field.field-auto-suggest" labeled "Field 2"
    And I click on the button labeled "Save Report"
    Then I should see "Your report has been saved!"
    And I wait for another 2 seconds

    ##VERIFY: included field
    When I click on the button labeled "View report"
    Then I should see "Preferred Name"

    #FUNCTIONAL_REQUIREMENT
    #ACTION:  edit filters
    When I click on the button labeled "Edit Report"
    And I click on the field labeled "Filter 1"
    And I enter "years_injury" into the input field labeled "Filter 1"
    And I should see the dropdown field labeled "Filter 1" with the options below
    | =                |
    | not =            |
    | contains         |
    | does not contain |
    | starts with      |
    | ends with        |
    And I select "=" on the dropdown field labeled "Filter 1"
    And I enter "1" into the field identified by "input.limiter-value" labeled "Filter 1"
    And I click on the field labeled "Filter 2"
    And I enter "default_years" into the input field labeled "Filter 2"
    And I should see the dropdown field labeled "Filter 2" with the options below
    | =     |
    | not = |
    | <     |
    | < =   |
    | >     |
    | > =   |
    And I select "=" on the dropdown field labeled "Filter 2"
    And I enter "18" into the field identified by "input.limiter-value" labeled "Filter 2"
    And I click on the button labeled "Save Report"
    Then I should see "Your report has been saved!"
    And I wait for another 2 seconds

    ##VERIFY: included field
    When I click on the button labeled "Continue editing report"
    And I select "prescreening_complete \"Complete?\"" on the dropdown field labeled "Live Filter 1" 
    And I select "email_address \"Please provide your email address:\"" on the dropdown field labeled "First by"
    And I should see the dropdown field labeled "Ascending order" with the options below
    | Ascending order  |
    | Descending order |
    And I select "Ascending order" on the dropdown field labeled "Ascending order" 
    And I click on the button labeled "Save Report"
    Then I should see "Your report has been saved!"
    And I wait for another 2 seconds

    ##VERIFY: included field
    When I click on the button labeled "View report"
    Then I should see "Live filters:"

#END
