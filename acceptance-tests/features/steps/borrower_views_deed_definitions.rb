Given(/^a mortgage deed has been created$/) do
  @deed = create_deed_data('deed_lots_of_provisions')
end

And(/^I navigate to the deed search page$/) do
  visit("#{$BORROWER_FRONTEND_URL}/deed/search")
end

When(/^I search for a deed with reference "([^"]*)"$/) do |arg1|
  fill_in 'deedRefNumber', with: arg1
  click_button('Search')
end

Then(/^the Sign your mortgage deed page is displayed$/) do
  assert_selector(".//*[@id='content']/div/h1", text: 'Sign your mortgage deed')
end

Then(/^the title number appears on the page$/) do
  assert_selector(".//*[@id='title-number']", text: @deed['deed']['operative-deed']['title']['title-number'])
end

Then(/^the property address appears on the page$/) do
  assert_selector("//*[@id='property-address']", text: @deed['deed']['operative-deed']['title']['address'])
end

Then(/^the borrower name appears on the page$/) do
  assert_selector("//*[@id='borrower-name-0']", text: @deed['deed']['operative-deed']['borrowers'])
end

Then(/^the borrower address appears on the page$/) do
  assert_selector("//*[@id='borrower-address-0']",
                  text: @deed['deed']['operative-deed']['borrowers']['address'])
end

Then(/^the lender name appears on the page$/) do
  assert_selector("//*[@id='lender-name']", text: @deed['deed']['operative-deed']['lender']['lender-name'])
end

Then(/^the charging clause appears on the page$/) do
  assert_selector("//*[@id='clauses-and-provisions']/*",
                  text: @deed['deed']['operative-deed']['charging-clause'])
end

Then(/^the additional provisions appear on the page$/) do
  assert_selector("//*[@id='clauses-and-provisions']/*",
                  text: @deed['deed']['operative-deed']['provisions'])
end

Then(/^the Invalid deed reference page is displayed$/) do
  assert_selector("//*[@id='search-deed-form']/p",
                  text: 'The deed you are looking for does not exist!')
end
