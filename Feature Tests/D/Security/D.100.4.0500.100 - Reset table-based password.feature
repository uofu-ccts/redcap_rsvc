Feature: Security: The REDCap Application will allow to ability to reset a user's table-based account password. 

  As a REDCap end user
  I want to see that the system allows an administrator to reset the password for a table-based user
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance in the protected enviornment

  Scenario: D.100.4.0500.100 Reset table-based password     
    #FUNCTIONAL REQUIREMENT
    ##ACTION: Reset password
    Given I login to REDCap Shadow with an Admin account
    And I click on the link labeled "Control Center"
    And I click on the link labeled "Browse Users"
    And I click on the link labeled "View User List By Criteria"
    And I click on the button labeled "Display User List"
    And I click on the link labeled "user1000_1"
    And I click on the button labeled "Edit user info"
    And I enter (my email) into the input field labeled "Primary email:"
    And I click on the button labeled "Save"
    And I click on the button labeled "Return to previous page"
    And I click on the button labeled "Reset password"
    Then I should see "RESET PASSWORD FOR USER 'user1000_1'?"
    And I click on the button labeled "OK"
    Then I should see "An email has been sent to (my email) with a link to allow them to set a new password."
    And I click on the button labeled "Close"
    And I logout
    
    #VERIFY
    Then I should see an email containing the following text: "This email was sent because you requested that your REDCap password be reset for the user \"user1000_1\". Click the link below to set your new password and log in."
    Given I click on the link labeled "Set your new REDCap password"
    Then I should see "Set Your Password"
    And I enter "Testing123" into the input field labeled "Password"
    And I enter "Testing123" into the input field labeled "Re-type password"
    And I click on the button labeled "Submit"
    Then I should see "Home"
    And I should see "My Projects"
#END


