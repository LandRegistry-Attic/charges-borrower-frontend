Given(/^I navigate to the borrower frontend "([^"]*)" page$/) do |path|
  visit("#{$BORROWER_FRONTEND_URL}#{path}")
end

When(/^I click on the "([^"]*)" link$/) do |link_name|
  click_link(link_name)
end

Then(/^the "([^"]*)" page is displayed$/) do |page_title|
  page.has_selector?(:css, 'h1', text: page_title)
end
