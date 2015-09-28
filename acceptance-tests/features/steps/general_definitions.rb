Given(/^I navigate to the borrower frontend "([^"]*)" page$/) do |path|
  visit(Env.borrower_frontend + path)
end

When(/^I click on the "([^"]*)" link$/) do |button_name|
  click_link(button_name)
end

When(/^I click on the "([^"]*)" button$/) do |button_name|
  click_button(button_name)
end

Then(/^the "([^"]*)" page is displayed$/) do |page_title|
  expect(page).to have_content(page_title)
end
