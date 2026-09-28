Feature: Data Comparison Tool DDE Module: The system shall support the ability to compare two records within the same project and display their differences.

  As a REDCap end user
  I want to see that the data comparison tool displays the differences between two records

  Scenario: D.4.17.100.100 Identify differences across two records
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.4.17.100.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status"
    Then I see Project status: "Production"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: create record 2
    When I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    And I click the bubble to add a record for the "Prescreening" longitudinal instrument on event "Screening"
    And I enter "Harry Potter" into the data entry form field labeled "Preferred Name" 
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    ##VERIFY
    Then I should see "Record ID 2 successfully added"

    ##ACTION: create record 3
    When I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    And I click the bubble to add a record for the "Prescreening" longitudinal instrument on event "Screening"
    And I enter "Hermione Granger" into the data entry form field labeled "Preferred Name" 
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    ##VERIFY
    Then I should see "Record ID 3 successfully added"

    ##ACTION: compare two records within the same project
    When I click on the link labeled "Data Comparison Tool"
    And I select "2 - Screening" on the first dropdown field labeled "--- Choose a record ---"
    And I select "3 - Screening" on the second dropdown field labeled "--- Choose a record ---"
    And I click on the button labeled "Compare"

    ##VERIFY
    Then I should see "Differences were found between the two records"
    And I should see "Label (field name)"
    And I should see "Form Name"
    And I should see "Record ID"
    And I should see "2"
    And I should see "3"
    And I should see "Screening"
    And I should see "Preferred Name (prefname)"
    And I should see "Prescreening"
    And I should see "Harry Potter"
    And I should see "Hermione Granger"