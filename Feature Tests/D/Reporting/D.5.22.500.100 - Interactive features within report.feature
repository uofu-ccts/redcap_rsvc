Feature: Reporting: The system shall support the ability for reports to link with the following features:  Stats & Charts | Export Data  |  Print  |  Edit Report

  As a REDCap end user
  I want to see that Reporting is functioning as expected

  Scenario: D.5.22.500.100 Interactive features within report 
    #SETUP
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.5.22.500.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button

    #SETUP_PRODUCTION
    When I click on the link labeled "Project Setup"
    And I wait for another 3 seconds
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far"
    And I click on the button labeled "YES, Move to Production Status"
    Then I should see "Project status:  Production"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION:  create report
    When I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Create New Report"
    And I enter "D.5.22.500.100 REPORT" into the input field labeled "Name of Report:"
    And I click on the field labeled "Field 2"
    And I enter "prefname" into the field identified by "input.x-form-text.x-form-field.field-auto-suggest" labeled "Field 2"
    And I click on the button labeled "Save Report"
    Then I should see "Your report has been saved!"
    And I wait for another 3 seconds
    And I click on the button labeled "Return to My Reports & Exports"
    Then I should see a table row containing the following values in the reports table:
        | 5 | D.5.22.500.100 REPORT |
    
    ##VERIFY: stats & charts
    When I click on the button labeled "Stats & Charts" in the row labeled "D.5.22.500.100 REPORT"
    Then I should see "D.5.22.500.100 REPORT"
    And I should see "Preferred Name"
    And I should see "Total"
    And I should see "Count"
    And I should see "Missing"

    ##VERIFY: export data
    When I click on the button labeled "Export Data"
    Then I should see "Exporting"
    And I should see "Choose export format"
    And I should see "CSV / Microsoft Excel (raw data)"
    And I should see "CSV / Microsoft Excel (labels)"
    And I should see "SPSS Statistical Software"
    And I should see "SAS Statistical Software"
    And I should see "R Statistical Software"
    And I should see "Stata Statistical Software"
    And I should see "CDISC ODM (XML)"
    And I should see "De-identification options"
    And I should see "Known Identifiers:"
    And I should see "Remove All Identifier Fields"
    And I should see "Hash the Record ID field"
    And I should see "Free-form text:"
    And I should see "Remove unvalidated Text fields"
    And I should see "Remove Notes/Essay box fields"
    And I should see "Date and datetime fields:"
    And I should see "Remove all date and datetime fields"
    And I should see "Shift all dates by value between 0 and 364 days"
    And I should see "Also shift all survey completion timestamps by value between 0 and 364 days"
    And I should see "Advanced data formatting options"
    And I should see "Export blank values for gray Form Status?"
    And I should see "Set CSV delimiter character"
    And I should see "Force all numbers into a specified decimal format?"
    And I should see "Export Data"
    And I click on the button labeled "Cancel"

    ##VERIFY: print report option
    Then I should see "Print Page"

    ##VERIFY: edit report
    When I click on the button labeled "Edit Report"
    Then I should see "Edit Existing Report:"
    And I should see "D.5.22.500.100 REPORT"
    And I select "prescreening_complete \"Complete?\"" on the dropdown field labeled "Live Filter 1" 
    And I click on the button labeled "Save Report"
    Then I should see "Your report has been saved!"
    And I click on the button labeled "Return to My Reports & Exports"
    Then I should see a table row containing the following values in the reports table:
        | 5 | D.5.22.500.100 REPORT |

#END
