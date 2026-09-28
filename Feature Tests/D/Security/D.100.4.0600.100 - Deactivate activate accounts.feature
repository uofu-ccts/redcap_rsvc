Feature: Security: The system will provide the ability to activate and deactivate user accounts. 

  As a REDCap end user
  I want to see that the system allows accounts to be deactivated and activated.

  Scenario: D.100.4.0600.100 Deactivate activate accounts 
    #FUNCTIONAL REQUIREMENT
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
    And I click on the link labeled "unsuspend user"
    Then I should see "Success! The user has now been unsuspended and will now be able to access REDCap again."
    And I click on the button labeled "Close"
    And I logout
    
    #VERIFY
    Given I successfully login to REDCap with the user "Test_User1"
    Then I should see "Home"
    And I should see "My Projects"
    And I should see "Log out"
#END


