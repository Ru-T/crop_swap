require 'test_helper'

class CropTest < ActiveSupport::TestCase

  test "crop is ripe" do
    c1 = Crop.create!(user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today + 8.days)

    assert c1.is_ripe?

    c2 = Crop.create!(user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today + 7.days, expires_on: Date.today + 10.days)

    refute c2.is_ripe?

    c3 = Crop.create!(user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 3.days, expires_on: Date.today - 2.days)

    refute c3.is_ripe?
  end

  test "crop about to expire" do
    c1 = Crop.create!(user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today + 2.days)

    assert c1.about_to_expire?

    c2 = Crop.create!(user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 7.days, expires_on: Date.today - 2.days)

    refute c2.about_to_expire?

    c3 = Crop.create!(user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today + 2.days, expires_on: Date.today + 5.days)

    refute c3.about_to_expire?
  end

  test "crop with pending trades" do
    c1 = Crop.create!(user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today + 2.days)
    c2 = Crop.create!(user_id: 2, crop_type_id: 2,
      description: "This radish is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today + 2.days)

    t1 = Trade.create!(trade_type_id: 1, crop: c1, consumer_id: 2, message: "I'd like to swap for my eggplants.",
      grower_id: 1, accepted: nil)
    t2 = Trade.create!(trade_type_id: 1, crop: c1, consumer_id: 2, message: "I'd like to swap for my eggplants.",
      grower_id: 1, accepted: false)
    t3 = Trade.create!(trade_type_id: 1, crop: c2, consumer_id: 2, message: "I'd like to swap for my eggplants.",
      grower_id: 1, accepted: true)

    assert c1.trades.pending
    refute c2.trades.pending
  end

  test "available crops for browsing" do
    current_user = User.create!(email: "ruti@mail.com", name: "Ruti the Farmer", password: "password",
      description: "I am a happy farmer living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
      zip_code: 27701, phone_number: "555-555-5555")

    available_crop = Crop.create!(user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today + 2.days)
    expired_crop = Crop.create!(user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today - 2.days)
    my_crop = Crop.create!(user: current_user, crop_type_id: 2,
      description: "This radish is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today + 2.days)
    off_the_market_crop = Crop.create!(user: current_user, crop_type_id: 3,
      description: "This radish is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today + 2.days)
    trade = Trade.create!(trade_type_id: 1, crop: off_the_market_crop, consumer_id: 2, message: "I'd like to swap for my eggplants.",
      grower_id: 1, accepted: true)

    c1 = Crop.available_crops(current_user)
    assert c1.include?(available_crop)
    refute Crop.available_crops(current_user).include?(expired_crop)
    refute Crop.available_crops(current_user).include?(my_crop)
    refute Crop.available_crops(current_user).include?(off_the_market_crop)
  end

end
