Given(/^I navigate to the view mortgage deed page$/) do
  visit("#{$BORROWER_FRONTEND_URL}/deed/view?deedRefNum=1")
end

When(/^I click the Sign deed button$/) do
  click_button('Sign the deed')
end

Then(/^the signing confirmation page is displayed$/) do
  assert_selector(".//*[@id='content']/div/p", text: 'You have signed the deed')
end

Given(/^I have signed my mortgage deed$/) do
  Given I navigate to the view mortgage deed page
  When I click the Sign deed button
end

When(/^I navigate to the deed API and retrieve the json$/) do
  @deed = HTTP.get("#{$DEED_API_URL}/deed/1")
end

Then(/^the json includes the signature consisting of full name and date of signature$/) do
  JSON.parse(@deed.body)['operative-deed']['signatures'][0]
end

Given(/^borrower 1 views a deed that is not associated with their id$/) do
  visit("#{$BORROWER_FRONTEND_URL}/deed/view?deedRefNum=2")
end

When(/^borrower 1 attempts to sign the deed$/) do
  click_button('Sign the deed')
end

Then(/^an invalid status code is displayed$/) do
  expect(page.status_code.to eq(403))
end
