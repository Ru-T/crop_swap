require 'test_helper'

class TradeTest < ActiveSupport::TestCase

  test "reject all other trades" do
    u1 = User.create!(id: 1, email: "grower@mail.com", password:"password")
    u2 = User.create!(id: 2, email: "consumer1@mail.com", password:"password")
    u3 = User.create!(id: 3, email: "consumer2@mail.com", password:"password")

    c1 = Crop.create!(id: 1, user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: "2015-11-8", expires_on: "2015-11-9")

    t1 = Trade.create!(trade_type_id: 1, crop_id: 1, consumer_id: 2,
      message: "I'd like to swap for my eggplants.", grower_id: 1)
    t2 = Trade.create!(trade_type_id: 2, crop_id: 1, consumer_id: 3,
      message: "I'd like to swap for my time.", grower_id: 1)

    t1.accepted = true
    t1.save

    t2.reload

    assert_equal false, t2.accepted
  end

end
