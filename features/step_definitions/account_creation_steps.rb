Given(/^I do not have an account on the site$/) do
end

When(/^I click the "([^"]*)" link$/) do |link|
  click_on link
end

When(/^I enter my email address$/) do
  fill_in 'Email', with: 'newuser@test.com'
end

When(/^I enter a password with correct confirmation$/) do
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
end

When(/^I enter a password with incorrect confirmation$/) do
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'xyz'
end

Then(/^I am notified that my password confirmation does not match$/) do
  expect(page).to have_content("Password confirmation doesn't match Password")
end

When(/^I enter "([^"]*)" as my email address$/) do |email|
  fill_in 'Email', with: email
end

Then(/^I am notified that my email address is invalid\.$/) do
  expect(page).to have_content("Email is invalid")
end
