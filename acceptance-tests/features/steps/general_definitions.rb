Given(/^I have created the following deed:$/) do |deed_json|
  @@deed_id = create_deed_data(deed_json)
  @@TEST_DEEDS.push(@@deed_id)
end

Given(/^I navigate to the borrower frontend "([^"]*)" page$/) do |path|
  visit($BORROWER_FRONTEND_URL + path)
end

Then(/^the "([^"]*)" page is displayed$/) do |page_title|
  expect(page).to have_content(page_title)
end
