Given(/^borrower one of two navigates to sign the deed page$/) do
  steps %(Given I navigate to the borrower frontend "/deed/search" page)
  @borrower_token = @created_deed['deed']['operative-deed']['borrowers'][0]['token']
  fill_in('borrower_token', with: @borrower_token)
  click_button('Search')
end

When(/^I enter the borrowers name "([^"]*)" and select to sign the deed$/) do |name|
  fill_in('user-name', with: name)
  click_button('Sign the deed')
end

Then(/^a message is displayed "([^"]*)"$/) do |message|
  expect(page).to have_content(message["message"])
end

Then(/^borrower two is listed under the message "([^"]*)"$/) do |borrower2|
  expect(page).to have_content(borrower2["borrower2"])
end

Given(/^borrower one "([^"]*)" has already signed the deed$/) do |name|
  steps %(Given borrower one of two navigates to sign the deed page)
  steps %(When I enter the borrowers name "#{name}" and select to sign the deed)
end

When(/^borrower two of two navigates to sign the deed page$/) do
  steps %(Given I navigate to the borrower frontend "/deed/search" page)
  @deed = HTTP.get(Env.deed_api + '/deed/' + @deed_id.to_s)
  @borrower_token =
    JSON.parse(@deed.body)['deed']['operative-deed']['borrowers'][1]['token']
  fill_in('borrower_token', with: @borrower_token)
  click_button('Search')
end

And(/^no borrowers are listed under the message$/) do
  page.should have_no_content('John Hughes')
  page.should have_no_content('Susan Paula Hughes')
end
