@inform_all_borrowers_signed

Feature:
    As a Borrower who has signed a deed
    I want to see whether all other borrowers have signed
    So that I know who is at fault for any delays


Acceptance criteria
  - message to inform borrower which other borrowers need to sign
  - message displayed to borrower when all borrowers have signed
    (Everyone has now signed the deed)

Background:
    Given I have created a case and deed with two borrowers

@delete_test_data
Scenario: First borrower signs mortgage deed

    Given borrower one of two navigates to sign the deed page
    When I enter the borrowers name "John Hughes" and select to sign the deed
    Then a message is displayed "The following people still need to sign the mortgage deed"
    And borrower two is listed under the message "Susan Paula Hughes"

@delete_test_data
Scenario: Second borrower signs mortgage deed

    Given borrower one "John Hughes" has already signed the deed
    And borrower two of two navigates to sign the deed page
    When I enter the borrowers name "Susan Paula Hughes" and select to sign the deed
    Then a message is displayed "Everyone has now signed the deed"
    And no borrowers are listed under the message
