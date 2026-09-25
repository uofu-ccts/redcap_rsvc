Feature: User Interface > Survey Distribution Tools > Participant List: The system shall allow users to configure Participant List responses as anonymous or identified.

  As a REDCap end user
  I want to see that the system allows both anonymous and identified responses in the Participant List.

  Scenario: D.3.15.1500.100 Participant List responses can be configured as anonymous or identified
    #SETUP_PRODUCTION
    Given I successfully login to REDCap with the user "Test_Admin"
    And I create a new project named "D.3.15.1500.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "CTSIBMICCanonicalProject.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I wait for another 2 seconds
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far"
    And I click on the button labeled "YES, Move to Production Status"
    Then I should see "Project status:"
    And I should see "Production"

    #SETUP_ANONYMOUS_PARTICIPANT_LIST
    Given I click on the button labeled "Disable" in the row labeled "Designate an email field for communications (including survey invitations and alerts)"
    And I click on the button labeled "Undesignate field"
    And I wait for 1 second
    Then I should see a button labeled "Enable" in the row labeled "Designate an email field for communications (including survey invitations and alerts)"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Add a participant while identifiers are disabled
    When I click on the link labeled "Survey Distribution Tools"
    And I click on the link labeled "Participant List"
    And I click on the button labeled "Add participants"
    And I enter "anonymous@example.com" into the textarea field labeled "Add Emails to Participant List"
    And I click on the button labeled "Add participants"
    Then I should see "PARTICIPANTS ADDED!"
    And I click on the button labeled "Close"

    ##VERIFY: Participant List responses are anonymous while participant identifiers are disabled
    Then I should see "Survey Response Status:"
    And I should see "Anonymous*"
    And I should see a table header and rows containing the following values in the participant list table:
      | Email                 | Participant Identifier |
      | anonymous@example.com | Disabled               |

    ##ACTION: Enable participant identifiers and add an identified participant
    When I click on the button labeled "Enable"
    Then I should see "Are you sure you wish to ENABLE Participant Identifiers?"
    When I click on the button labeled "Yes, ENABLE Participant Identifiers"
    Then I should see "Participant Identifiers have now been ENABLED."
    And I click on the button labeled "Close"
    And I click on the button labeled "Add participants"
    And I enter "identified@example.com, Identified Participant" into the textarea field labeled "Add Emails to Participant List"
    And I click on the button labeled "Add participants"
    Then I should see "PARTICIPANTS ADDED!"
    And I click on the button labeled "Close"

    ##VERIFY: Participant List responses are identified when an identifier is configured
    Then I should see "Survey Response Status:"
    And I should see "Anonymous"
    And I should see a table header and rows containing the following values in the participant list table:
      | Email                  | Participant Identifier |
      | identified@example.com | Identified Participant |

#END
