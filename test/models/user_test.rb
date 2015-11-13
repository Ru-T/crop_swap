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

  test "user has pending trade on their own crop" do
    u = User.create!(email: "ruti@mail.com", name: "Ruti the Farmer", password: "password",
      description: "I am a happy farmer living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
      zip_code: 27701, phone_number: "555-555-5555")
    u2 = User.create!(email: "ruti2@mail.com", name: "Ruti the Farmer", password: "password",
      description: "I am a happy farmer living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
      zip_code: 27701, phone_number: "555-555-5555")

    c = Crop.create!(user: u, crop_type_id: 1, description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today + 8.days)
    c2 = Crop.create!(user: u2, crop_type_id: 1, description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today + 8.days)

    t1 = Trade.create!(crop: c, consumer: u2, message: "I'd like to swap for my eggplants.", accepted: nil)
    t2 = Trade.create!(crop: c2, consumer: u, message: "I'd like to swap for my eggplants.", accepted: true)

    assert u.has_crop_with_pending_trade?
    refute u2.has_crop_with_pending_trade?
  end

  test "user has crops with no pending trades" do
    u = User.create!(email: "ruti@mail.com", name: "Ruti the Farmer", password: "password",
      description: "I am a happy farmer living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
      zip_code: 27701, phone_number: "555-555-5555")
    u2 = User.create!(email: "ruti2@mail.com", name: "Ruti the Farmer", password: "password",
      description: "I am a happy farmer living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
      zip_code: 27701, phone_number: "555-555-5555")
    u3 = User.create!(email: "ruti3@mail.com", name: "Ruti the Farmer", password: "password",
      description: "I am a happy farmer living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
      zip_code: 27701, phone_number: "555-555-5555")
    u4 = User.create!(email: "ruti4@mail.com", name: "Ruti the Farmer", password: "password",
      description: "I am a happy farmer living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
      zip_code: 27701, phone_number: "555-555-5555")

    c = Crop.create!(user: u, crop_type_id: 1, description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today + 8.days)
    c2 = Crop.create!(user: u2, crop_type_id: 1, description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today + 8.days)
    c3 = Crop.create!(user: u3, crop_type_id: 1, description: "This potato is delectable. You want to trade me for this beet.",
      weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today + 8.days)

    t2 = Trade.create!(crop: c2, consumer: u, message: "I'd like to swap for my eggplants.", accepted: true)
    t3 = Trade.create!(crop: c3, consumer: u, message: "I'd like to swap for my eggplants.", accepted: nil)

    assert u.has_crop_without_pending_trade?
    refute u2.has_crop_without_pending_trade?
    refute u3.has_crop_without_pending_trade?
    refute u4.has_crop_without_pending_trade?
  end

end
