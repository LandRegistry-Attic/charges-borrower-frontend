@US01

Feature: Borrower Signs the Deed
    As a Borrower
    I want to be able to sign my mortgage deed (Mock)
    So that the mortgage company will release the money

Acceptance criteria
- Borrower can sign the deed (mock)
- Once the borrower signs the deed the confirmation page is displayed
 - user can enter name into name field


Scenario: Borrower signs mortgage deed
    Given I navigate to the view mortgage deed page
    When I click the Sign deed button
    Then the signing confirmation page is displayed
