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

end
