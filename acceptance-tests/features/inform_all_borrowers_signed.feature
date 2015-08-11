@US18

Feature:
    As a Borrower who has signed a deed
    I want to see whether all other borrowers have signed
    So that I know who is at fault for any delays


Acceptance criteria
  - message to inform borrower which other borrowers need to sign
  - message displayed to borrower when all borrowers have signed
    (All borrowers have signed the deed)
  - same borrower cannot sign the deed twice, when viewing deed after signing,
    the signature area will not be displayed and will be replaced by message
    'You have already signed the deed'
  - once the deed has been signed and saved, all saved signatures will appear in
    the Borrower electronic signature box
  - there will be a Borrower electronic signature(s) box displayed for each
    borrower that needs to sign

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


Scenario: First borrower signs mortgage deed

    Given borrower one navigates to sign the deed page
    When I enter the borrowers "name"
    Then a message is displayed 'The following people still need to sign the mortgage deed'
    And borrower two is listed under the message


Scenario: Second borrower signs mortgage deed

    Given borrower two navigates to sign the deed page
    When I enter the borrowers "name"
    Then a message is displayed 'Everyone has now signed the deed'
    And no borrowers are listed under the message
