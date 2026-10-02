Feature: User Interface: The system shall interface with API functions create new folders, export files and folders, import files, and delete files.

  As a REDCap end user
  I want to see that the system will support API functions that will interface with the File Repository

  Scenario: D.3.26.900.100 File Repository API Functions 
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.3.26.900.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Simulate the user creating a new folder in the File Repository using the API
    Given I click on the link labeled "API Playground"
    And I click on the button labeled "Create API token now"
    And I select "Create a New Folder in the File Repository" on the dropdown field labeled "API Method"
    And I enter "Test Folder" into the input field labeled "Name of new folder"
    And I click on the button labeled "Execute Request"
    And I wait for another 1 second
    And I click on the button labeled "Execute Request"
    ##VERIFY
    And I click on the link labeled "File Repository"
    Then I should see "Test Folder"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Simulate the user importing a file into the File Repository using the API
    Given I click on the link labeled "API Playground"
    And I select "Import a File into the File Repository" on the dropdown field labeled "API Method"
    And I upload a "png" format file located at "import_files/File_Upload.png", by clicking the button near "Choose File" to browse for the file, and clicking the button labeled "Execute Request" to upload the file
    And I click on the link labeled "Update"
    And I click on the button labeled "Execute Request"

    ##VERIFY
    And I click on the link labeled "File Repository"
    Then I should see "File_Upload.png"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Simulate the user exporting a file from the File Repository using the API
    Given I click on the link labeled "API Playground"
    And I select "Export a File from the File Repository" on the dropdown field labeled "API Method"
    And I select "File_Upload.png" on the dropdown field labeled "File doc_id"
    And I click on the button labeled "Execute Request"
    And I wait for 1 second
    ##VERIFY
    Then I should see "exported.png"
    And I should see "HTTP Status: 200"   

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Simulate the user deleting a file from the File Repository using the API
    Given I select "Delete a File from the File Repository" on the dropdown field labeled "API Method"
    And I select "File_Upload.png" on the dropdown field labeled "File doc_id"
    And I click on the button labeled "Execute Request"
    And I wait for 1 second
    ##VERIFY
    Then I should see "HTTP Status: 200"
    And I click on the link labeled "File Repository"
    Then I should NOT see "File_Upload.png"
    
#END