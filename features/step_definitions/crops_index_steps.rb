Given(/^there are (\d+) crops in the database$/) do |number|
  FactoryGirl.create_list(:crop, number.to_i, user: FactoryGirl.create(:user))
end

Given(/^I am logged into the site$/) do
  visit root_path
  fill_in 'Email', with: 'newestuser@test.com'
  fill_in 'Password', with: 'password'
  click_on "Log in"
end

Then(/^I see a list of (\d+) crops in the database$/) do |number|
  expect(Crop.all.count).to eq number.to_i
end

Then(/^the list of (\d+) crops are paginated in pages of (\d+) books per page$/) do |number_crops, number_pages|
  pending
  # expect(page).to have_css("#view_crop", count: 12)
  # find("Next>").click
  # expect(page).to have_button("view_crop", count: 12)
  # find("Next>").click
  # expect(page).to have_button("view_crop", count: 12)
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
