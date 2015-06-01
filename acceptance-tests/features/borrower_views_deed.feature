@borrower_views_deed

Feature: Borrower Views the Deed
    As a Borrower
    I want to search for my mortgage document
    So that I can view it

Background:
    Given I navigate to the deed search page

Scenario: Borrower enters a valid mortgage reference number
    When I search for a deed with reference "1"
    Then the Sign your mortgage deed page is displayed
    And the title number appears on the page
    And the property address appears on the page
    And the borrower name appears on the page
    And the borrower address appears on the page
    And the lender name appears on the page
    And the charging clause appears on the page
    And the additional provisions appear on the page

Scenario: Borrower enters invalid deed reference
    When I search for a deed with reference "5"
    Then the Invalid deed reference page is displayed
