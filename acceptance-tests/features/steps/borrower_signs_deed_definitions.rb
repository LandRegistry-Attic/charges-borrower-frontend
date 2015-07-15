Given(/^I have signed my mortgage deed as "([^"]*)"$/) do |name|
  steps %Q{
  Given I search for the created deed
  When I enter the borrowers signature "#{name}"
  And I click on the "Sign the deed" button
  }
end

When(/^I enter the borrowers signature "([^"]*)"$/) do |name|
  fill_in('borrowerName', with: name)
end

When(/^I request deed data from the api$/) do
  @deed = HTTP.get($DEED_API_URL + "/deed/" + @@deed_id.to_s)
end

Then(/^the deed data includes the signature consisting of full name and date$/) do
  JSON.parse(@deed.body)['operative-deed']['signatures'][0]
end

Given(/^I view a deed that is not associated with my id$/) do
  visit($BORROWER_FRONTEND_URL + "/deed/view?deedRefNum=2")
end

Then(/^an invalid status code is displayed$/) do
  expect(page.status_code.to eq(403))
end
