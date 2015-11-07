# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "ruti@mail.com", name: "Ruti the Farmer", password: "password",
  description: "I am a happy farmer living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
  zip_code: 27701, phone_number: "555-555-5555")
User.create!(email: "eric@mail.com", name: "Eric the Farmer", password: "password",
  description: "I am a responsible consumer living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
  zip_code: 27701, phone_number: "555-555-5555")
User.create!(email: "mason@mail.com", name: "Mason the Farmer", password: "password",
  description: "I am a pig farmer and I am loving it living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
  zip_code: 27701, phone_number: "555-555-5555")
User.create!(email: "kelly@mail.com", name: "Kelly the Farmer", password: "password",
  description: "I am a farmer's market addict living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
  zip_code: 27701, phone_number: "555-555-5555")

CropType.create!(crop_type: "Potato")
CropType.create!(crop_type: "Tomato")
CropType.create!(crop_type: "Beet")
CropType.create!(crop_type: "Carrot")
CropType.create!(crop_type: "Radish")
CropType.create!(crop_type: "Spinach")
CropType.create!(crop_type: "Watermelon")

tt1 = TradeType.create!(name: "Crops", description: "Swap for your crops")
tt2 = TradeType.create!(name: "Time", description: "Swap for your time")
tt3 = TradeType.create!(name: "Labor", description: "Swap for your labor")

c1 = Crop.create!(user_id: 1, crop_type_id: 1, description: "This potato is delectable. You want to trade me for this beet.",
  weight: 3, ripe_on: "2015-11-8", expires_on: "2015-11-9")
c2 = Crop.create!(user_id: 2, crop_type_id: 2, description: "This tomato is delectable. You want to trade me for this beet.",
  weight: 2, ripe_on: "2015-11-19", expires_on: "2015-11-24")
c3 = Crop.create!(user_id: 3, crop_type_id: 3, description: "This beet is delectable. You want to trade me for this beet.",
  weight: 4, ripe_on: "2015-11-19", expires_on: "2015-11-19")
c4 = Crop.create!(user_id: 4, crop_type_id: 4, description: "This carrot is delectable. You want to trade me for this beet.",
  weight: 13, ripe_on: "2015-11-1", expires_on: "2015-11-3")
c5 = Crop.create!(user_id: 1, crop_type_id: 5, description: "This radish is delectable. You want to trade me for this beet.",
  weight: 30, ripe_on: "2015-11-22", expires_on: "2015-11-29")
c6 = Crop.create!(user_id: 2, crop_type_id: 6, description: "This spinach is delectable. You want to trade me for this beet.",
  weight: 13, ripe_on: "2015-12-01", expires_on: "2015-12-10")
c7 = Crop.create!(user_id: 3, crop_type_id: 7, description: "This watermelon is delectable. You want to trade me for this beet.",
  weight: 2, ripe_on: "2015-11-19", expires_on: "2015-11-19")

c1.trade_types << tt1
c1.save

c2.trade_types << tt2
c2.save

c3.trade_types << tt3
c3.save

c4.trade_types << tt1
c4.trade_types << tt2
c4.save

c5.trade_types << tt1
c5.trade_types << tt2
c5.trade_types << tt3
c5.save

c6.trade_types << tt1
c6.trade_types << tt2
c6.save

c7.trade_types << tt1
c7.trade_types << tt3
c7.save

Trade.create!(trade_type_id: 1, crop_id: 1, consumer_id: 2, message: "I'd like to swap for my eggplants.",
  grower_id: 1)
Trade.create!(trade_type_id: 2, crop_id: 2, consumer_id: 3, message: "I'd like to swap for my time.",
  grower_id: 2)
Trade.create!(trade_type_id: 3, crop_id: 3, consumer_id: 4, message: "I'd like to swap for my labor in the farmer's market.",
  grower_id: 3)
