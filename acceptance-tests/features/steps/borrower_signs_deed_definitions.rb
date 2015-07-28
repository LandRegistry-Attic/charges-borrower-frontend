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
  @deed = HTTP.get($DEED_API_URL + "/deed/" + @deed_id.to_s)
end

When(/^I change the deed id in the cookie$/) do
  page.driver.set_cookie('borrower_id', 'the is a random phrase')
end

Then(/^the deed data includes the signature consisting of "([^"]*)"$/) do |name|
  JSON.parse(@deed.body)['deed']['operative-deed']['signatures'].each do |signature|
    expect(signature).to include(name)
  end
end

Then(/^an invalid status code is displayed$/) do
  expect(page.status_code).to eq(403)
end
