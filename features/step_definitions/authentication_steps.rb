Given(/^I have an account on the site$/) do
  FactoryGirl.create(:user, email: "newestuser@test.com", password: "password")
end

When(/^I visit the site root path$/) do
  visit root_path
end

Then(/^I am presented with a login page$/) do
  expect(page).to have_content("Log in")
end

When(/^I enter my correct email$/) do
  fill_in 'Email', with: 'newestuser@test.com'
end

When(/^I enter my password$/) do
  fill_in 'Password', with: 'password'
end

When(/^I click the "([^"]*)" button$/) do |button|
  click_on button
end

Then(/^I am redirected to the crops index page$/) do
  visit crops_path
end

When(/^I enter the wrong password$/) do
  fill_in 'Password', with: 'xyz'
end

Then(/^I am notified that my password is incorrect$/) do
  expect(page).to have_content("Invalid email or password.")
end
