@borrower_views_deed

Feature: Borrower Views the Deed
    As a Borrower
    I want to search for my mortgage document
    So that I can view it

Background:
    Given I have created a case and deed with two borrowers

@delete_test_data
Scenario: Borrower enters a valid deed reference

    - correct deed displayed when borrower id entered
    - deed must display:
      - property description
      - borrower's name and address
      - lender's name  (not address)
      - charging clause
      - additional provisions

    Given I navigate to the borrower frontend "/deed/search" page
    When I search for the created deed
    Then the "Sign your mortgage deed" page is displayed
    And the property description is displayed on the deed
      | STREET ADDRESS          | EXTENDED ADDRESS  | LOCALITY  | POSTCODE  |
      | 108 Sutton High Street  | New Addington     | Croydon   | CR0 6TG   |
    And the borrowers are displayed on the deed
      | BORROWERS               |
      | John Hughes             |
      | Susan Paula Hughes      |
    And the borrower addresses are displayed on the deed
      | STREET ADDRESS    | EXTENDED ADDRESS  | LOCALITY      | POSTCODE  |
      | 1 High Street     |                   | Nottingham    | NO9 6YU   |
      | 54 Low Street     |                   | Nottingham    | N02 5MS   |
    And the lenders name "Bank of England PLC" is displayed on the deed
    And the charging clause is displayed on the deed
    And the additional provisions are displayed on the deed
      | ADDITIONAL PROVISIONS                                                                                                                                             |
      | This Mortgage Deed incorporates the Lenders Mortgage Conditions and Explanation 2006, a copy of which has been received by the Borrower.                          |
      | The lender is under an obligation to make further advances and applies for the obligation to be entered in the register.                                          |
      | No disposition of the registered estate by the proprietor of the registered estate is to be registered without a written consent signed by Bank of England Plc.   |

@delete_test_data
Scenario: Borrower enters invalid deed reference

    - information message displayed when incorrect id entered

    Given I navigate to the borrower frontend "/deed/search" page
    When I search for an invalid deed
    Then the "Deed not found" page is displayed
