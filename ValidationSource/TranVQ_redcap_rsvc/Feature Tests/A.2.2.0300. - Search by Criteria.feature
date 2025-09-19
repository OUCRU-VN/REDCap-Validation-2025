Feature: A.2.2.0300. Add/Manage users Control Center - Users: The system shall support the ability to search for individual users and view/edit user information for username, first name, last name and/or primary email.

  As a REDCap end user
  I want to see that Search Users is functioning as expected.

  Scenario: A.2.2.0300.100 Search by username, first name, last name and/or primary email

  Given I login to REDCap with the user "tranvq_adminuser"
    And I click on the link labeled "Control Center"
    And I click on the link labeled "Browse Users"
    And I click on the link labeled "View User List By Criteria"
    Then I should see "View User List By Criteria"

    #FUNCTIONAL REQUIREMENT
    ##ACTION Search by username with "Keyword search"
  #Username is tranvq_adminuser
  When I enter "tranvq_adminuser" into the field with the placeholder text of "Keyword search"
    And I click on the button labeled "Display User List"
    #VERIFY_SEARCH
    Then I should see a table header and rows containing the following values in the browse users table:
      | Username         | First Name | Last Name | Email               |
      | tranvq_adminuser | Admin      | Test      | tranvq@oucru.org    |


    #FUNCTIONAL REQUIREMENT
    ##ACTION Search by First Name with "Keyword search"
    When I click on the link labeled "View User List By Criteria"
    And I enter "Admin" into the field with the placeholder text of "Keyword search"
    And I click on the button labeled "Display User List"
    Then I should see a table header and rows containing the following values in the browse users table:
      | Username         | First Name | Last Name | Email               |
      | tranvq_adminuser | Admin      | Test      | tranvq@oucru.org    |

    #FUNCTIONAL REQUIREMENT
    ##ACTION Search by Last Name with "Keyword search"
    When I click on the link labeled "View User List By Criteria"
    And I enter "Test" into the field with the placeholder text of "Keyword search"
    And I click on the button labeled "Display User List"
    Then I should see a table header and rows containing the following values in the browse users table:
      | Username         | First Name | Last Name | Email               |
      | tranvq_adminuser | Admin      | Test      | tranvq@oucru.org |

    #FUNCTIONAL REQUIREMENT
    ##ACTION Search by Email with "Keyword search"
    When I click on the link labeled "View User List By Criteria"
    And I enter "tranvq@oucru.org" into the field with the placeholder text of "Keyword search"
    And I click on the button labeled "Display User List"
    Then I should see a table header and rows containing the following values in the browse users table:
      | Username         | First Name | Last Name | Email               |
      | tranvq_adminuser | Admin      | Test      | tranvq@oucru.org    |

    #FUNCTIONAL REQUIREMENT
    ##ACTION Edit user information
    When I click on the link labeled "View User List By Criteria"
    And I click on the button labeled "Display User List"
  When I click on the link labeled exactly "tranvq_testuser1"
    Then I should see "Editable user attributes"
    And I click on the button labeled "Edit user info"
    And I clear the field labeled "First name:"
    And I enter "User1" into the input field labeled "First name:"
    And I click on the button labeled "Save"
    Then I should see "User has been successfully saved."

    #VERIFY
    When I click on the link labeled "Browse Users"
    And I click on the link labeled "View User List By Criteria"
  And I enter "tranvq_testuser1" into the field with the placeholder text of "Keyword search"
    And I click on the button labeled "Display User List"
    Then I should see a table header and rows containing the following values in the browse users table:
      | Username         | First Name | Last Name | Email               |
      | tranvq_testuser1 | User1      | Test      | tranvq@oucru.org    |

    ##VERIFY_LOG
    When I click on the link labeled "User Activity Log"
    Then I should see a table header and rows containing the following values in a table:
      | User             | Event     | 
      | tranvq_adminuser | Edit user | 
#End