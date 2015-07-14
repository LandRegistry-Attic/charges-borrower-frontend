@US02

Feature: Borrower Views the Deed
    As a Borrower
    I want to search for my mortgage document
    So that I can view it

Acceptance Criteria:
    -When I search using the correct reference number the deed displays.
    -It must display:
      - property description
      - borrower's name and address
      - lender's name  (not address)
      - charging clause
      - additional provisions
    -Incorrect reference number returns  - error message (new page).

Background:
    Given I have created the following deed:
    """
    {
     "id":"1",
     "mdref": "MD0149A",
     "title": {
       "title-number": "GHR67832",
       "address": {
         "street-address": "18 Lordly Place",
         "extended-address": "",
         "locality": "London",
         "postal-code": "N12 5TN"
       }
     },
     "lender": {
       "name": "Bank of England PLC",
       "company-number": "2347672",
       "address": {
         "street-address": "12 Trinity Place",
         "extended-address": "Regents Street",
         "locality": "London",
         "postal-code": "NW10 6TQ"
       }
     },
     "borrowers":[{
       "id": "1",
       "name": "Peter Smith",
       "address": {
         "street-address": "83 Lordship Park",
         "extended-address": "",
         "locality": "London",
         "postal-code": "N16 5UP"
       }
     },{
       "id": "2",
       "name": "Sarah Jane Smith",
       "address": {
         "street-address": "25 Hanger Lane",
         "extended-address": "Harrow",
         "locality": "London",
         "postal-code": "N11 8RD"
       }
     }],
     "restrictions": ["This is my restriction"],
     "provisions": ["This Mortgage Deed incorporates the Lenders Mortgage Conditions and Explanation 2006, a copy of which has been received by the Borrower.",
       "The lender is under an obligation to make further advances and applies for the obligation to be entered in the register.",
       "No disposition of the registered estate by the proprietor of the registered estate is to be registered without a written consent signed by Bank of England Plc."]
    }
    """
    And I navigate to the borrower frontend "/deed/search" page


Scenario: Borrower enters a valid deed reference
    When I search for the created deed
    Then the "Sign your mortgage deed" page is displayed
    And the property description is displayed on the deed
      | STREET ADDRESS    | EXTENDED ADDRESS  | LOCALITY  | POSTCODE  |
      | 18 Lordly Place   |                   | London    | N12 5TN   |
    And the borrowers are displayed on the deed
      | BORROWERS         |
      | Peter Smith       |
      | Sarah Jane Smith  |
    And the borrower addresses are displayed on the deed
      | STREET ADDRESS    | EXTENDED ADDRESS  | LOCALITY  | POSTCODE  |
      | 83 Lordship Park  |                   | London    | N16 5UP   |
      | 25 Hanger Lane    | Harrow            | London    | N11 8RD   |
    And the lenders name "Bank of England PLC" is displayed on the deed
    And the charging clause is displayed on the deed
    And the additional provisions are displayed on the deed
      | ADDITIONAL PROVISIONS                                                                                                                                             |
      | This Mortgage Deed incorporates the Lenders Mortgage Conditions and Explanation 2006, a copy of which has been received by the Borrower.                          |
      | The lender is under an obligation to make further advances and applies for the obligation to be entered in the register.                                          |
      | No disposition of the registered estate by the proprietor of the registered estate is to be registered without a written consent signed by Bank of England Plc.   |

Scenario: Borrower enters invalid deed reference
    When I search for an invalid deed
    Then the "Deed not found!" page is displayed
