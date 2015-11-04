# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "ruti@mail.com", password: "password", description: "I am a happy farmer.", zip_code: 27701, phone_number: "555-555-5555")
User.create!(email: "eric@mail.com", password: "password", description: "I am a responsible consumer.", zip_code: 27701, phone_number: "555-555-5555")
User.create!(email: "mason@mail.com", password: "password", description: "I am a pig farmer and I am loving it.", zip_code: 27701, phone_number: "555-555-5555")
User.create!(email: "kelly@mail.com", password: "password", description: "I am a farmer's market addict.", zip_code: 27701, phone_number: "555-555-5555")

CropType.create!(crop_type: "potato")
CropType.create!(crop_type: "tomato")
CropType.create!(crop_type: "beet")
CropType.create!(crop_type: "carrot")
CropType.create!(crop_type: "radish")
CropType.create!(crop_type: "spinach")
CropType.create!(crop_type: "watermelon")

Crop.create!(user_id: 1, crop_type_id: 1, description: "This potato is delectable. You want to trade me for this beet.", weight: 3)
Crop.create!(user_id: 2, crop_type_id: 2, description: "This tomato is delectable. You want to trade me for this beet.", weight: 2)
Crop.create!(user_id: 3, crop_type_id: 3, description: "This beet is delectable. You want to trade me for this beet.", weight: 4)
Crop.create!(user_id: 4, crop_type_id: 4, description: "This carrot is delectable. You want to trade me for this beet.", weight: 13)
Crop.create!(user_id: 1, crop_type_id: 5, description: "This radish is delectable. You want to trade me for this beet.", weight: 30)
Crop.create!(user_id: 2, crop_type_id: 6, description: "This spinach is delectable. You want to trade me for this beet.", weight: 13)
Crop.create!(user_id: 3, crop_type_id: 7, description: "This watermelon is delectable. You want to trade me for this beet.", weight: 2)

TradeType.create!(name: "Crops")
TradeType.create!(name: "Time")
TradeType.create!(name: "Labor")
