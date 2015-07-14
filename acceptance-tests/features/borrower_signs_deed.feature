@US29

Feature: Borrower Signs the Deed
    As a Borrower
    I want to be able to sign my mortgage deed (Mock)
    So that the mortgage company will release the money

Acceptance criteria
    - Borrower can sign the deed (mock)
    - Once the borrower signs the deed the confirmation page is displayed
    - Borrower can enter name into name field
    - Signed deed is saved to database
    - Requesting a saved deed from deed API, signature is attached
    - Signature consists of full name and date signed
    - Borrower can only sign deed for deed id matching borrower



Scenario: Borrower signs mortgage deed
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
     }],
     "restrictions": ["This is my restriction"],
     "provisions": ["This Mortgage Deed incorporates the Lenders Mortgage Conditions and Explanation 2006, a copy of which has been received by the Borrower.",
       "The lender is under an obligation to make further advances and applies for the obligation to be entered in the register.",
       "No disposition of the registered estate by the proprietor of the registered estate is to be registered without a written consent signed by Bank of England Plc."]
    }
    """
    And I navigate to the borrower frontend "/deed/search" page
    And I search for the created deed
    When I click on the "Sign the deed" button
    Then the "You have signed the deed" page is displayed

Scenario: Retrieve signed mortgage deed from deed API
    Given I have signed my mortgage deed
    When I navigate to the deed API and retrieve the json
    Then the json includes the signature consisting of full name and date of signature

Scenario: Borrower can only sign deed for deed id matching borrower
    Given borrower 1 views a deed that is not associated with their id
    When borrower 1 attempts to sign the deed
    Then an invalid status code is displayed
