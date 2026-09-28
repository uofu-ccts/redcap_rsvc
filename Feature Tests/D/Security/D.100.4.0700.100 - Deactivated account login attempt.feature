Feature: Security: A user cannot log in to the system if their account has been deactivated. 

  As a REDCap end user
  I want to see that the system will prohibit a user from logging in if their account has been deactivated.

  Scenario: D.100.4.0700.100 Deactivated account login attempt 
    #FUNCTIONAL REQUIREMENT
    #REDUNDANT: D.100.4.0600.100
    ##ACTION: Deactivate Account
    Given I successfully login to REDCap with the user "Test_Admin"
    And I click on the link labeled "Control Center"
    And I click on the link labeled "Browse Users"
    And I click on the link labeled "View User List By Criteria"
    And I click on the button labeled "Display User List"
    And I click on the link labeled "test_user1"
    And I click on the button labeled "Suspend user account"
    Then I should see "Success! The user has now been suspended from REDCap."
    And I click on the button labeled "Close"
    And I logout
    
    #VERIFY
    Given I attempt to login to REDCap with the user "Test_User1"
    Then I should see "The following REDCap user account has been suspended:"
    And I should see "test_user1"
    And I should see "(Test User1)"
    And I should see "Access to REDCap is prohibited."
#END


