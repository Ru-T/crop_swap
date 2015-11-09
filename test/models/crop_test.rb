require 'test_helper'

class CropTest < ActiveSupport::TestCase

  test "crop is ripe" do
    c1 = Crop.create!(id: 1, user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: "2015-11-8", expires_on: "2015-11-20")

    assert_equal true, c1.is_ripe?

    c2 = Crop.create!(id: 1, user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: "2015-11-22", expires_on: "2015-11-30")

    assert_equal false, c2.is_ripe?

    c3 = Crop.create!(id: 1, user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: "2015-11-1", expires_on: "2015-11-3")

    assert_equal false, c3.is_ripe?
  end

  test "crop about to expire" do
    c1 = Crop.create!(id: 1, user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: "2015-11-8", expires_on: "2015-11-11")

    assert_equal true, c1.about_to_expire?

    c2 = Crop.create!(id: 1, user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: "2015-11-01", expires_on: "2015-11-15")

    assert_equal true, c2.about_to_expire?

    c3 = Crop.create!(id: 1, user_id: 1, crop_type_id: 1,
      description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: "2015-11-1", expires_on: "2015-11-3")

    assert_equal false, c3.about_to_expire?
  end

end
