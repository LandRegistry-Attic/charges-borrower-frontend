@US18

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

Scenario: First borrower signs mortgage deed

    Given borrower one of two navigates to sign the deed page
    When I enter the borrowers name and select to sign the deed
    Then a message is displayed "The following people still need to sign the mortgage deed"
    Then borrower two is listed under the message "Susan Hughes"

Scenario: Second borrower signs mortgage deed

    Given borrower one has already signed the deed
    And borrower two of two navigates to sign the deed page
    When I enter the second borrowers name and select to sign the deed
    Then a message is displayed "Everyone has now signed the deed"
    And no borrowers are listed under the message
