Feature: Availability and Recovery: Disaster recovery and business continuity planning, along with testing evidence, will be developed and executed for the EIC system and environment, effectively demonstrating the ability to recover and not lose data in the event of an outage or issues with the system or hosting environment. 

 As a REDCap end user
 I want to see that data can be recovered by following the CTSI BMIC backup and recovery process.
 #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.100.4.0300.100 Data recovery
    #SETUP
    Given I login to REDCap Shadow with an Admin account
    And I create a new project named "D.100.4.0300.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button

    ##ACTION: create record
    When I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    And I click the bubble to add a record for the "Prescreening" longitudinal instrument on event "Screening"
    And I enter "Luke Skywalker" into the data entry form field labeled "Preferred Name" 
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    ##VERIFY
    Then I should see "Record ID 2 successfully added"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: delete record
    Given I wait for 24 hours
    And I login to REDCap Shadow with an Admin account
    And I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "2"
    And I select "Delete record (all forms/events)" on the dropdown field labeled "Choose action for record"
    And I click on the button labeled "DELETE RECORD"
    Then I should see a dialog box containing the following text: "Record ID \"2\" was successfully deleted."
    And I click on the button labeled "Close"
    And I click on the link labeled "Record Status Dashboard"
    Then I should NOT see "Luke Skywalker"
    And I logout

    #FUNCTIONAL REQUIREMENT
    ##ACTION: recover record
    Given I login to REDCap Shadow Recovery with an Admin account
    And I click on the link labeled "D.100.4.0300.100"
    And I click on the link labeled "Record Status Dashboard"
    Then I should see "2"
    And I should see "Luke Skywalker"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: delete project
    Given I login to REDCap Shadow with an Admin account
    And I click on the link labeled "D.100.4.0300.100"
    And I click on the link labeled "Other Functionality"
    And I click on the button labeled "Delete the project"
    And I enter "DELETE" into the input field labeled "TYPE \"DELETE\" BELOW" in the dialog box 
    And I click on the button labeled "Delete the project"
    And I click on the button labeled "Yes, delete the project"
    Then I should see a dialog box containing the following text: "Project successfully deleted!"
    And I click on the button labeled "Close"
    And I click on the link labeled "Control Center"
    And I click on the link labeled "Browse Projects"
    And I enter "D.100.4.0300.100" into the input field labeled "Search project title by keyword(s):"
    And I click on the button labeled "Search project title"
    And I click on the link labeled "Delete it now"
    And I enter "DELETE" into the input field labeled "TYPE \"DELETE\" BELOW" in the dialog box 
    And I click on the button labeled "Delete the project"
    And I click on the button labeled "Yes, delete the project"
    Then I should see a dialog box containing the following text: "Project successfully deleted!"
    And I click on the button labeled "Close"
    And I enter "D.100.4.0300.100" into the input field labeled "Search project title by keyword(s):"
    And I click on the button labeled "Search project title"
    Then I should see "There are no projects to display"
    And I logout

    #FUNCTIONAL REQUIREMENT
    ##ACTION: recover project
    Given I login to REDCap Shadow Recovery with an Admin account
    Then I should see "D.100.4.0300.100"
    And I click on the link labeled "D.100.4.0300.100"
    And I click on the link labeled "Other Functionality"
    And I click on the button labeled "Download metadata & data (XML)"
    And I click on the button labeled "Export Entire Project (metadata & data)"
    And I click on the download icon to receive the file for the "XML" format in the dialog box
    And I click on the button labeled "Close"
    And I logout
    And I login to REDCap Shadow with an Admin account
    And I create a new project named "D.100.4.0300.100 Recovered" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file (Recovered XML for D.100.4.0300.100), and clicking the "Create Project" button
    And I click on the link labeled "Record Status Dashboard"
    Then I should see "2"
    And I should see "Luke Skywalker"
#END