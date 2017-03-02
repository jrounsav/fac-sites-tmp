Feature:
  Testing the managing of OpenScholar


  @api @features_first @javascript
  Scenario: Check that all of the apps are turned on
    Given I am logging in as "john"
      And I visit "john"
      And I make sure admin panel is open
      And I open the admin panel to "Settings"
     When I click "Enable / Disable Apps"
      #And I should see "Apps"
     Then I should see the "spaces" table with the following <contents>:
      | Blog          | Public |
      | Booklets      | Public |
      | Classes       | Public |
      | Dataverse     | Public |
      | Events        | Public |
      | Image Gallery | Public |
      | Links         | Public |
      | News          | Public |
      | Basic Pages   | Public |
      | Presentations | Public |
      | Profiles      | Public |
      | Publications  | Public |
      | Reader        | Public |
      | Software      | Public |

  @api @features_first @javascript
    Scenario: Check site owner can't manage permissions of disabled app.
      Given I am logging in as "john"
        And I set feature "edit-os-booklets" to "Disabled" on "john"
       When I visit "john/cp/users/permissions"
       Then I should not see "Create book page content"

  @api @features_first @javascript
    Scenario: Check enabling app brings back its permissions.
      Given I am logging in as "john"
        And I set feature "edit-os-booklets" to "Public" on "john"
       When I visit "john/cp/users/permissions"
       Then I should see "Create book page content"

  @api @features_first @javascript
    Scenario: Check content editor can edit widgets by default
      Given I am logging in as "john"
       When I give the user "klark" the role "content editor" in the group "john"
        And I open the user menu
        And I click "Logout"
        And I am logging in as "klark"
        And I go to "john/os/widget/boxes/os_addthis/edit"
       Then I should see "AddThis" in an "h1" element

  @api @features_first @javascript
    Scenario: Check content editor without edit widgets permission can't edit
      Given I am logging in as "john"
       When I give the user "klark" the role "content editor" in the group "john"
        And I go to "john/cp/users/permissions"
       When I click "Edit roles and permissions"
        And I press "Confirm"
        And I go to "john/cp/users/permissions"
       Then I should see the button "Save permissions"
        And I press "Close Menu"
        And I remove from the role "content editor" in the group "john" the permission "edit-boxes"
        And I open the user menu
        And I click "Logout"
        And I am logging in as "klark"
        And I go to "john/os/widget/boxes/os_addthis/edit"
       Then I should not see the text "AddThis"

  @api @features_first @javascript
    Scenario: Check rolling back permissions to re-enable widget permissions
      Given I am logging in as "john"
       #When I give the user "klark" the role "content editor" in the group "john"
        And I go to "john/cp/users/permissions"
       When I click "Restore default roles and permissions"
        And I wait for the overlay to open
        And I press "Confirm"
        And the overlay closes
        And I open the user menu
        And I click "Logout"
        And I am logging in as "klark"
        And I go to "john/os/widget/boxes/os_addthis/edit"
       Then I should see "AddThis" in an "h1" element
