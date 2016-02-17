When(/^I select a crop type$/) do
  find('#crop_crop_type_id').find(:xpath, 'option[2]').select_option
end

When(/^I enter a description$/) do
  fill_in "Description:", with: "This is a description of the crop"
end

When(/^I upload a crop pic$/) do
  attach_file('file','image.png')
end

When(/^I enter a crop weight$/) do
  fill_in "Weight:", with: "12"
end

When(/^I enter a ripe on date$/) do
  page.execute_script("$('#crop_ripe_on').datepicker('setDate', '02/28/2016')")
end

When(/^I enter a expires on date$/) do
  page.execute_script("$('#crop_expires_on').datepicker('setDate', '03/28/2016')")
end

When(/^I select what I am willing to swap$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I visit my profile page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I see the crop I just posted$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I see an error that weight can't be blank$/) do
  expect(page).to have_content("Weight can't be blank")
end
