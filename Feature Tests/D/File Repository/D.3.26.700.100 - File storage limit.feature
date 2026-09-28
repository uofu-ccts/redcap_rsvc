Feature: File Repository: The system shall support file storage limit. Includes Control center limitation | Project settings limitation

  As a REDCap end user
  I want to see that the system will support file storage limits.

  Scenario: D.3.26.700.100 File storage limit 
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.3.26.700.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I wait for another 2 seconds
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status"
    Then I see Project status: "Production"

    #SETUP PROJECT SETTINGS
    Given I click on the link labeled "Edit Project Settings"
    And I enter "1" into the input field labeled "File Repository: File storage limit (in MB)" 
    And I click on the button labeled "Save Changes"
    Then I should see "Your changes have been saved!"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Fail to upload file larger than 1 MB
    Given I click on the link labeled "D.3.26.700.100"
    And I click on the link labeled "File Repository"
    And I click the button labeled "Select files to upload" to select and upload "/import_files/LargeFileUpload.txt" to File Repository and see that the upload failed
    Then I should see "Upload Error!"

    #REMOVE PROJECT SETTINGS
    ##ACTION: Remove project file upload limit setting
    Given I click on the link labeled "Setup"
    And I click on the link labeled "Edit Project Settings"
    And I clear the field labeled "File Repository: File storage limit (in MB)" 
    And I click on the button labeled "Save Changes"
    Then I should see "Your changes have been saved!"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Successfully upload file larger than 1 MB
    Given I click on the link labeled "3.26.700.100"
    And I click on the link labeled "File Repository"
    And I click the button labeled "Select files to upload" to select and upload the following file to the File Repository:
      | /import_files/LargeFileUpload.txt |
    Then I should see "100% uploaded"

    #SETUP CONTROL CENTER FILE STORAGE SETTINGS
    Given I click on the link labeled "Control Center"
    And I click on the link labeled "File Upload Settings"
    And I enter "2" into the input field labeled "File Repository: File storage limit (in MB) for all projects" 
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Fail to upload file larger than 1 MB
    Given I click on the link labeled "My Projects"
    And I click on the link labeled "D.3.26.700.100"
    And I click on the link labeled "File Repository"
    And I click the button labeled "Select files to upload" to select and upload "/import_files/LargeFileUpload.txt" to File Repository and see that the upload failed
    Then I should see "Upload Error!"