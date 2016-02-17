Then(/^I wishlist one of the crops$/) do
  find("#wishlist_icon", match: :first).click
end

Then(/^I visit my wishlisted crops page$/) do
  visit wishlists_path
end

Then(/^I see the wishlisted crop$/) do
  pending
  # expect(page).to have_content("Posted") NO WISHLISTED CROPS
end

Then(/^I view one of the crops$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I have wishlisted a crop$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I see a wishlisted crop$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I remove the crop from my wishlist$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I no longer see the wishlisted crop$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
