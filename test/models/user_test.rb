require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user has proposed trade for a crop" do
    u = User.create!(email: "ruti@mail.com", name: "Ruti the Farmer", password: "password",
      description: "I am a happy farmer living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
      zip_code: 27701, phone_number: "555-555-5555")
    u2 = User.create!(email: "ruti2@mail.com", name: "Ruti the Farmer", password: "password",
      description: "I am a happy farmer living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
      zip_code: 27701, phone_number: "555-555-5555")

    c = Crop.create!(user: u2, crop_type_id: 1, description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today + 8.days)

    t1 = Trade.create!(trade_type_id: 1, crop: c, consumer: u, message: "I'd like to swap for my eggplants.",
      grower_id: 1)
    t2 = Trade.create!(trade_type_id: 2, crop_id: 2, consumer_id: 3, message: "I'd like to swap for my time.",
      grower_id: 2)

    assert u.has_proposed_trade_for?(c)
  end

end
