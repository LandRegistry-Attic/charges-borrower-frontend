@borrower_signs_deed

Feature: Borrower Signs the Deed
    As a Borrower
    I want to be able to sign my mortgage deed (Mock)
    So that the mortgage company will release the money

@delete_test_data
Scenario: Borrower signs mortgage deed

    - Borrower can sign the deed
    - Borrower can enter name into name field
    - Once the borrower signs the deed the confirmation page is displayed

    Given I have created a case and deed with one borrower
    And I navigate to the borrower frontend "/deed/search" page
    When I search for the created deed
    And I enter the borrowers signature "John Hughes"
    And I click on the "Sign the deed" button
    Then the "You have signed the deed" page is displayed

@delete_test_data
Scenario: Retrieve signed mortgage deed from deed API

    - Signed deed is saved to database
    - Requesting a saved deed from deed API, signature is attached
    - Signature consists of full name

    Given I have created a case and deed with one borrower
    And I navigate to the borrower frontend "/deed/search" page
    And I have signed my mortgage deed as "John Hughes"
    When I request deed data from the api
    Then the deed data includes the signature consisting of "John Hughes"

@delete_test_data
Scenario: Borrower can only sign deed for deed id matching borrower

    - Borrower can only sign deed for deed id matching borrower

    Given I have created a case and deed with one borrower
    And I navigate to the borrower frontend "/deed/search" page
    When I search for the created deed
    And I change the deed id in the cookie
    And I click on the "Sign the deed" button
    Then an invalid status code is displayed
