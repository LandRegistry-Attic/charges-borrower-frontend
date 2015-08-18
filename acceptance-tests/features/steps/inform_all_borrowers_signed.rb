Given(/^borrower one of two navigates to sign the deed page$/) do
  visit($BORROWER_FRONTEND_URL + '/deed/search')
  @deed = HTTP.get($DEED_API_URL + '/deed/' + @deed_id.to_s)
  @borrower_token =
    JSON.parse(@deed.body)['deed']['operative-deed']['borrowers'][0]['token']
  fill_in('borrower_token', with: @borrower_token)
  click_button('Search')
end

When(/^I enter the borrowers name and select to sign the deed$/) do
  fill_in('user-name', with: 'Peter Smith')
  click_button('Sign the deed')
end

Then(/^a message is displayed "([^"]*)"$/) do |message|
  expect(page).to have_content(message["message"])
end

Then(/^borrower two is listed under the message "([^"]*)"$/) do |borrower2|
  expect(page).to have_content(borrower2["borrower2"])
end

Given(/^borrower one has already signed the deed$/) do
  steps %(Given borrower one of two navigates to sign the deed page)
  steps %(When I enter the borrowers name and select to sign the deed)
end

When(/^borrower two of two navigates to sign the deed page$/) do
  visit($BORROWER_FRONTEND_URL + '/deed/search')
  @deed = HTTP.get($DEED_API_URL + '/deed/' + @deed_id.to_s)
  @borrower_token =
    JSON.parse(@deed.body)['deed']['operative-deed']['borrowers'][1]['token']
  fill_in('borrower_token', with: @borrower_token)
  click_button('Search')
end

And(/^I enter the second borrowers name and select to sign the deed$/) do
  fill_in('user-name', with: 'Sarah Jane Smith')
  click_button('Sign the deed')
end

#Then(/^a message is displayed 'Everyone has now signed the deed'$/) do
  #expect(page).to have_content('Everyone has now signed the deed')
#end

And(/^no borrowers are listed under the message$/) do
  page.should have_no_content('Peter Smith')
  page.should have_no_content('Sarah Jane Smith')
end
