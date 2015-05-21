Given(/^I navigate to the deed search page$/) do
  visit("#{$CHARGES_URL}/deed/search")
end

When(/^I search for a deed with reference "([^"]*)"$/) do |arg1|
  fill_in("//*[@id='deed-ref']", :with => arg1)
  click_button('Search')
end

Then(/^the “Sign your mortgage deed” page is displayed$/) do
  assert_selector("//*h1", text: 'Sign your mortgage deed')
end

Then(/^the title number appears on the page$/) do
  assert_selector("//*[@id='title-number']", text: 'GHR87832')
end

Then(/^the property address appears on the page$/) do
  assert_selector("//*[@id='address']/dd", text: 'Flat 16 Kingman Court')
end

Then(/^the “Invalid deed reference” page is displayed$/) do
  assert_selector(page.body, text: 'Invalid deed reference')
end
