@borrower_views_the_deed

Feature: Borrower Views the Deed
    As a Borrower
    I want to search for my mortgage document
    So that I can view it

Background:
    Given I navigate to the "search for deed" page

Scenario: Borrower enters a valid mortgage reference number
    When I search for a deed with reference "1234"
    Then the “Sign your mortgage deed” page is displayed
    And the title number appears on the page
    And the property address appears on the page

Scenario: Borrower enters invalid mortgage reference number
    When I search for a deed with reference "3456"
    Then the “Invalid deed reference” page is displayed
