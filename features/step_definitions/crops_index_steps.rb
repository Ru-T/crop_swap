Given(/^there are (\d+) crops in the database$/) do |number|
  user = FactoryGirl.create(:user, email: "otheruser@mail.com")
  FactoryGirl.create_list(:crop, number.to_i, user: user)
end

Given(/^I am logged into the site$/) do
  FactoryGirl.create(:user, email: "newestuser@test.com", password: "password")
  visit root_path
  fill_in 'Email', with: 'newestuser@test.com'
  fill_in 'Password', with: 'password'
  click_on "Log in"
end

Then(/^I see a list of crops in the database$/) do
  expect(Crop.all.count).to eq 100
end

Then(/^the list of (\d+) crops are paginated in pages of (\d+) books per page$/) do |arg1, arg2|
  # expect(page).to have_link("View Crop", count: 25)
  # find("//*[@class='pagination']//a[text()='2']").click
  # expect(page).to have_link("View Crop", count: 25)
  # find("//*[@class='pagination']//a[text()='3']").click
  # expect(page).to have_link("View Crop", count: 25)
  # find("//*[@class='pagination']//a[text()='4']").click
  # expect(page).to have_link("View Crop", count: 25)
end

Then(/^I sort the crops by "([^"]*)"$/) do |sort|
  click_on sort
end

Then(/^the crops are sorted based on when they were posted$/) do
  expect(Crop.order(:created_at).first).to eq Crop.first
  expect(page).to have_content(/#{Crop.first.crop_type.crop_type}.*#{Crop.fifth.crop_type.crop_type}/m)
end

Then(/^the crops are sorted by ripe on date$/) do
  expect(Crop.order(:ripe_on).first).to eq Crop.first
  expect(page).to have_content(/#{Crop.first.crop_type.crop_type}.*#{Crop.fifth.crop_type.crop_type}/m)
end

Then(/^the crops are sorted by expiry date$/) do
  expect(Crop.order(:expires_on).first).to eq Crop.first
  expect(page).to have_content(/#{Crop.first.crop_type.crop_type}.*#{Crop.fifth.crop_type.crop_type}/m)
end

Then(/^I see if a crop is ripe$/) do
  expect(page).to have_content("RIPE NOW!")
end

Then(/^I see when a crop is about to expire$/) do
  expect(page).to have_content("Expires in about!")
end
