Given(/^I navigate to the borrower frontend "([^"]*)" page$/) do |path|
  visit($BORROWER_FRONTEND_URL + path)
end

When(/^I click on the "([^"]*)" link$/) do |link_name|
  click_link(link_name)
end

Then(/^the "([^"]*)" page is displayed$/) do |page_title|
  expect(page).to have_content(page_title)
end
