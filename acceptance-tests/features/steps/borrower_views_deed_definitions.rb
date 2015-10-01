When(/^I search for the created deed$/) do
  @borrower_token =
    @created_deed['deed']['operative-deed']['borrowers'][0]['token']
  fill_in('borrower_token', with: @borrower_token)
  click_button('Search')
end

When(/^I search for an invalid deed$/) do
  fill_in('borrower_token', with: 0)
  click_button('Search')
end

Then(
  /^the property description is displayed on the deed$/
) do |property_description|
  property_description.hashes.each do |property|
    expect(page).to have_content(property['STREET ADDRESS'])
    expect(page).to have_content(property['EXTENDED ADDRESS'])
    expect(page).to have_content(property['LOCALITY'])
    expect(page).to have_content(property['POSTCODE'])
  end
end

Then(/^the borrowers are displayed on the deed$/) do |borrowers|
  borrowers.hashes.each do |borrower|
    expect(page).to have_content(borrower['BORROWERS'])
  end
end

Then(
  /^the borrower addresses are displayed on the deed$/
) do |borrower_addresses|
  borrower_addresses.hashes.each do |borrower_address|
    expect(page).to have_content(borrower_address['STREET ADDRESS'])
    expect(page).to have_content(borrower_address['EXTENDED ADDRESS'])
    expect(page).to have_content(borrower_address['LOCALITY'])
    expect(page).to have_content(borrower_address['POSTCODE'])
  end
end

Then(/^the lenders name "([^"]*)" is displayed on the deed$/) do |name|
  expect(page).to have_content(name)
end

Then(/^the charging clause is displayed on the deed$/) do
  expect(page).to have_content('You, the borrower, with full title guarantee, '\
                              'charge property to the lender by way of legal '\
                              'mortgage with the payment of all money secured '\
                              'by this charge.')
end

Then(
  /^the additional provisions are displayed on the deed$/
) do |additional_provisions|
  additional_provisions.hashes.each do |provision|
    expect(page).to have_content(provision['ADDITIONAL PROVISIONS'])
  end
end
