Given(/^I navigate to the deed search page$/) do
  visit("#{$CHARGES_URL}/deed/search")
end

When(/^I search for a deed with reference "([^"]*)"$/) do |arg1|
  fill_in 'deedRefNumber', with: arg1
  click_button('Search')
end

Then(/^the Sign your mortgage deed page is displayed$/) do
  assert_selector(".//*[@id='content']/div/h1", text: 'Sign your mortgage deed')
end

Then(/^the title number appears on the page$/) do
  assert_selector(".//*[@id='title-number']", text: 'GHR67832')

end

Then(/^the property address appears on the page$/) do
  assert_selector("//*[@id='property-address']", text: 'Flat 16 Kingman Court')
end

Then(/^the borrower name appears on the page$/) do
  assert_selector("//*[@id='borrower-name-0']", text: 'Peter Smith')
end

Then(/^the borrower address appears on the page$/) do
  assert_selector("//*[@id='borrower-address-0']", text: 'Flat 16 Kingman Court')
end

Then(/^the lender name appears on the page$/) do
  assert_selector("//*[@id='lender-name']", text: 'Bank of England Plc')
end

Then(/^the charging clause appears on the page$/) do
  assert_selector("//*[@id='clauses-and-provisions']/*", text: 'You, the borrower, with full title guarantee, charge property to the lender by way of legal mortgage with the payment of all money secured by this charge.')
end

Then(/^the additional provisions appear on the page$/) do
  assert_selector("//*[@id='clauses-and-provisions']/*", text: 'This Mortgage Deed incorporates the Lenders Mortgage Conditions and Explanation 2006, a copy of which has been received by the Borrower.')
  assert_selector("//*[@id='clauses-and-provisions']/*", text: 'The lender is under an obligation to make further advances and applies for the obligation to be entered in the register.')
  assert_selector("//*[@id='clauses-and-provisions']/*", text: 'No disposition of the registered estate by the proprietor of the registered estate is to be registered without a written consent signed by Bank of England Plc.')
end


Then(/^the Invalid deed reference page is displayed$/) do
  assert_selector("//*[@id='search-deed-form']/p", text: 'The deed you are looking for does not exist!')
end
