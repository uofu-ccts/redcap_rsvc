Feature: User Interface: The system shall provide the ability to email the user upon completion of an background data import large data files

    As a REDCap end user
    I want to see that Data import is functioning as expected

    Scenario: D.3.16.1500.100 Background data import email 
        #REDUNDANT Tested in B.3.16.1400
        #SETUP
        Given I login to REDCap with the user #Admin account for tester
        And I create a new project named "D.3.16.1500.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button

        #SETUP_PRODUCTION
        Given I click on the link labeled "Project Setup"
        And I click on the button labeled "Move project to production"
        And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
        And I click on the button labeled "YES, Move to Production Status"
        Then I should see Project status: "Production"

        Given I click on the link labeled "Data Import Tool"
        When I select "Import as background process (better for large data sets)" on the dropdown field labeled "Choose an import option"
        And I upload the file labeled "CTSIBMICBackgroundImport.csv"
        And I click on the button labeled "Confirm"
        And I click on the button labeled "Upload File"
        And I click the button labeled "Close"
        And I click the button labeled "Confirm"
        And I click on the button labeled "Upload"
        And I click on the button labeled "View background imports"
        And I wait for 3 minutes
        And I click the button labeled "Refresh table"
        Then I should see "Completed"
        ##This may take several minutes
        Then I should receive an email with a link "View the results of your data import"

        Given I Click on the "Record Status Dashboard"
        Then I should see a table header and rows containing the following values in the table:
            | Record ID    | Prescreening |
            | 1 Tester 123 |              |
            | 2 Test1      |              |
            | 3 Test2      |              |
            | 4 Test3      |              |
            | 5 Test4      |              |
        And I should see 4 records are in an incomplete status

        #VERIFY
        When I click the Link labeled "Logging"
        Then I should see a table header and rows including the following values in the logging table:
            | Username            | Action             | List of Data Changes OR Fields Exported |
            | SYSTEM (#Test user) | Create Record 5    | record_id=’5’                           |

    #END