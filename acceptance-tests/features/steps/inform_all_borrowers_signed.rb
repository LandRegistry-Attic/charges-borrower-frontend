Given(/^borrower one of two navigates to sign the deed page$/) do
  #navigate to the search page
  visit($BORROWER_FRONTEND_URL + "/deed/search")
  #search for deed
  @deed = HTTP.get($DEED_API_URL + '/deed/' + @deed_id.to_s)
  @borrower_token =
    JSON.parse(@deed.body)['deed']['operative-deed']['borrowers'][0]['token']
  puts @borrower_token
end

#scenario one
Then(/^two Borrower electronic signature boxes are displayed$/) do
  page.has_selector?(:xpath, '//input[@id="user-name"]')
  page.has_selector?(:xpath, '//label[@for="user-name"]')
end

#scenario two
Given(/^borrower one navigates to sign the deed page$/) do
#navigate to the search page
visit($BORROWER_FRONTEND_URL + "/deed/search")
#search for deed
@deed = HTTP.get($DEED_API_URL + '/deed/' + @deed_id.to_s)
@borrower_token =
  JSON.parse(@deed.body)['deed']['operative-deed']['borrowers'][0]['token']
puts @borrower_token
end

When(/^I enter the borrowers "([^"]*)"$/) do |arg1|
#wanted to say when borrower one of two signs
#enter borrowers signature
#click sign
  fill_in('borrowerName', with: name)
end
