@start_pages

Feature: Start Pages on Frontends
  In order to make demos a little easier, and expose our work to other teams better
  the team would like all Borrower And Conveyancer frontend apps
  to have simple gov.uk style start pages

Acceptance Criteria:
  - Click start button on borrower frontend start page takes you to /deed/search
  - Click start button on conveyancer frontend page takes you to /case

Scenario: Start Page on Borrower Frontend
  Given I navigate to the borrower frontend "/" page
  When I click on the "Start now" link
  Then the "Find your deed" page is displayed
