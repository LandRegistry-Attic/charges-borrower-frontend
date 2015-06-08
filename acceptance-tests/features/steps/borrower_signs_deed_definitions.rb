Given(/^I navigate to the view mortgage deed page$/) do
  visit("#{$CHARGES_URL}/deed/view?deedRefNum=1")
end

When(/^I click the Sign deed button$/) do
  click_button('Sign the deed')
end

Then(/^the signing confirmation page is displayed$/) do
  assert_selector(".//*[@id='content']/div/p", text: 'You have signed the deed')
end
