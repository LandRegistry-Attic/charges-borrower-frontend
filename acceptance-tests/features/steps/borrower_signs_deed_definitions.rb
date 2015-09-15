Given(/^I have signed my mortgage deed as "([^"]*)"$/) do |name|
  steps %(Given I search for the created deed)
  steps %(When I enter the borrowers signature "#{name}")
  steps %(And I click on the "Sign the deed" button)
end

When(/^I enter the borrowers signature "([^"]*)"$/) do |name|
  fill_in('borrowerName', with: name)
end

When(/^I request deed data from the api$/) do
  @deed = HTTP.get($DEED_API_URL + '/deed/' + @deed_id.to_s)
end

When(/^I change the deed id in the cookie$/) do
  page.driver.set_cookie('borrower_id', '24071987')
end

Then(/^the deed data includes the signature consisting of "([^"]*)"$/) do |name|
  @signatures = JSON.parse(@deed.body)['deed']['signatures']
  @signatures.each do |signature|
    expect(signature['signature']).to include(name)
  end
end

Then(/^an invalid status code is displayed$/) do
  expect(page.status_code).to eq(403)
end
