Feature: Availability and Recovery: The recovery of the application data will be available. 

 As a REDCap end user
 I want to see that a project can be recovered by following the CTSI BMIC backup and recovery process.
 #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.100.4.1000.100 Project recovery
    #SETUP
    Given I login to REDCap Shadow with an Admin account
    And I create a new project named "D.100.4.1000.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Record Status Dashboard"
    Then I should see "Tester 123"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: delete project
    Given I wait for 24 hours
    And I click on the link labeled "D.100.4.1000.100"
    And I click on the link labeled "Other Functionality"
    And I click on the button labeled "Delete the project"
    And I enter "DELETE" into the input field labeled "TYPE \"DELETE\" BELOW" in the dialog box 
    And I click on the button labeled "Delete the project"
    And I click on the button labeled "Yes, delete the project"
    Then I should see a dialog box containing the following text: "Project successfully deleted!"
    And I click on the button labeled "Close"
    And I click on the link labeled "Control Center"
    And I click on the link labeled "Browse Projects"
    And I enter "D.100.4.1000.100" into the input field labeled "Search project title by keyword(s):"
    And I click on the button labeled "Search project title"
    And I click on the link labeled "Delete it now"
    And I enter "DELETE" into the input field labeled "TYPE \"DELETE\" BELOW" in the dialog box 
    And I click on the button labeled "Delete the project"
    And I click on the button labeled "Yes, delete the project"
    Then I should see a dialog box containing the following text: "Project successfully deleted!"
    And I click on the button labeled "Close"
    And I enter "D.100.4.1000.100" into the input field labeled "Search project title by keyword(s):"
    And I click on the button labeled "Search project title"
    Then I should see "There are no projects to display"
    And I logout

    #FUNCTIONAL REQUIREMENT
    ##ACTION: recover project
    Given I login to REDCap Shadow Recovery with an Admin account
    Then I should see "D.100.4.1000.100"
    And I click on the link labeled "D.100.4.1000.100"
    And I click on the link labeled "Other Functionality"
    And I click on the button labeled "Download metadata & data (XML)"
    And I click on the button labeled "Export Entire Project (metadata & data)"
    And I click on the download icon to receive the file for the "XML" format in the dialog box
    And I click on the button labeled "Close"
    And I logout
    And I login to REDCap Shadow with an Admin account
    And I create a new project named "D.100.4.1000.100 Recovered" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file (Recovered XML for D.100.4.0300.100), and clicking the "Create Project" button
    And I click on the link labeled "Record Status Dashboard"
    Then I should see "1"
    And I should see "Tester 123"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: recover data
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Export Data" for the report named "All data (all records and fields)"
    And I click on the radio labeled "CSV / Microsoft Excel (raw data)"
    And I click on the button labeled "Export Data"
    And I click on the download icon to receive the file for the "csv" format in the dialog box
    Then I should have a latest downloaded "csv" file that contains the headings and rows below
    | record_id | redcap_event_name | redcap_repeat_instrument | redcap_repeat_instance | redcap_data_access_group | redcap_survey_identifier | prescreening_timestamp | hear_about |
    | 1         | screening_arm_1   |                          |                        |                          |                          |                        | 1          |                
    #NOTE: There are more columns, but should not be more than 2 rows
#END