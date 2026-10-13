Feature: User Interface: The system shall provide the ability to email the user upon completion of an background data import large data files

    As a REDCap end user
    I want to see that Data import is functioning as expected

    Scenario: D.3.16.1500.100 Background data import email 
        #SETUP
        Given I successfully login to REDCap with the user "Test_Admin"
        And I create a new project named "D.3.16.1500.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button

        #SETUP_PRODUCTION
        Given I click on the link labeled "Project Setup"
        And I click on the button labeled "Move project to production"
        And I click on the radio labeled "Keep ALL data saved so far"
        And I click on the button labeled "YES, Move to Production Status"
        Then I should see "Project status:  Production"

        Given I click on the link labeled "Data Import Tool"
        When I select "Import as background process (better for large data sets)" on the dropdown field labeled "Choose an import option"
        And I select "import_files/CTSIBMICBackgroundImport.csv" for the file upload field labeled "Select your CSV data file"
        And I click on the button labeled "Confirm"
        And I click on the button labeled "Upload File"
        And I click on the button labeled "Close"
        And I click on the link labeled "View background imports"
        And I save the URL linked by "View background imports" as "backgroundImports"
        And I click on the link labeled "Control Center"
        And I click on the link labeled "Cron Jobs"
        And I save the URL linked by "http://localhost:8080/cron.php" as "cron"
        And I visit the saved URL "cron"
        Then I should see "Cron Run Report"
        Given I visit the saved URL "backgroundImports"
        And I click on the button labeled "Refresh table"
        Then I should see "Completed"

        ##VERIFY: Background-import completion notification
        Given I click on the link labeled "Email Logging"
        Then I should see "Must agree to disclaimer before accessing page"
        And I click on the button labeled "I understand and agree"
        And I click on the button labeled "Search emails"
        Then I should see "1 matching results"
        Given I click the View msg icon for the first email
        Then I should see "test_admin@test.edu"
        And I should see "View the results of your data import"

        Given I click on the link labeled "Record Status Dashboard"
        Then I should see "Screening"
        And I should see "Prescreening"
        And I should see a table rows containing the following values in the record status dashboard table:
            | Test1 |
            | Test2 |
            | Test3 |
            | Test4 |
        And I should see the "Incomplete" icon for the "Prescreening" instrument on event "Screening" for record "2  Test1"
        And I should see the "Incomplete" icon for the "Prescreening" instrument on event "Screening" for record "3  Test2"
        And I should see the "Incomplete" icon for the "Prescreening" instrument on event "Screening" for record "4  Test3"
        And I should see the "Incomplete" icon for the "Prescreening" instrument on event "Screening" for record "5  Test4"

        #VERIFY
        When I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
            | Username            | Action             | List of Data Changes OR Fields Exported |
            | SYSTEM (Test_Admin) | Create record 5    | record_id = '5'                         |

    #END
