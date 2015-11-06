# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "ruti@mail.com", name: "Ruti the Farmer", password: "password",
  description: "I am a happy farmer living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
  zip_code: 27701, phone_number: "555-555-5555", profile_pic_file_name: "tomato-1.jpg", profile_pic_content_type: "image/jpeg",
  profile_pic_file_size: 10981, profile_pic_updated_at: "2015-11-04 20:55:24")
User.create!(email: "eric@mail.com", name: "Eric the Farmer", password: "password",
  description: "I am a responsible consumer living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
  zip_code: 27701, phone_number: "555-555-5555", profile_pic_file_name: "tomato-1.jpg", profile_pic_content_type: "image/jpeg",
  profile_pic_file_size: 10981, profile_pic_updated_at: "2015-11-04 20:55:24")
User.create!(email: "mason@mail.com", name: "Mason the Farmer", password: "password",
  description: "I am a pig farmer and I am loving it living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
  zip_code: 27701, phone_number: "555-555-5555", profile_pic_file_name: "tomato-1.jpg", profile_pic_content_type: "image/jpeg",
  profile_pic_file_size: 10981, profile_pic_updated_at: "2015-11-04 20:55:24")
User.create!(email: "kelly@mail.com", name: "Kelly the Farmer", password: "password",
  description: "I am a farmer's market addict living in the Hillsborough area. I grow potatoes and radishes and am excited to swap!",
  zip_code: 27701, phone_number: "555-555-5555", profile_pic_file_name: "tomato-1.jpg", profile_pic_content_type: "image/jpeg",
  profile_pic_file_size: 10981, profile_pic_updated_at: "2015-11-04 20:55:24")

CropType.create!(crop_type: "Potato")
CropType.create!(crop_type: "Tomato")
CropType.create!(crop_type: "Beet")
CropType.create!(crop_type: "Carrot")
CropType.create!(crop_type: "Radish")
CropType.create!(crop_type: "Spinach")
CropType.create!(crop_type: "Watermelon")

Crop.create!(user_id: 1, crop_type_id: 1, description: "This potato is delectable. You want to trade me for this beet.",
  weight: 3, crop_pic_file_name: "tomato-1.jpg", crop_pic_content_type: "image/jpeg", crop_pic_file_size: 10981,
  crop_pic_updated_at: "2015-11-04 20:58:31")
Crop.create!(user_id: 2, crop_type_id: 2, description: "This tomato is delectable. You want to trade me for this beet.",
  weight: 2, crop_pic_file_name: "tomato-1.jpg", crop_pic_content_type: "image/jpeg", crop_pic_file_size: 10981,
  crop_pic_updated_at: "2015-11-04 20:58:31")
Crop.create!(user_id: 3, crop_type_id: 3, description: "This beet is delectable. You want to trade me for this beet.",
  weight: 4, crop_pic_file_name: "tomato-1.jpg", crop_pic_content_type: "image/jpeg", crop_pic_file_size: 10981,
  crop_pic_updated_at: "2015-11-04 20:58:31")
Crop.create!(user_id: 4, crop_type_id: 4, description: "This carrot is delectable. You want to trade me for this beet.",
  weight: 13, crop_pic_file_name: "tomato-1.jpg", crop_pic_content_type: "image/jpeg", crop_pic_file_size: 10981,
  crop_pic_updated_at: "2015-11-04 20:58:31")
Crop.create!(user_id: 1, crop_type_id: 5, description: "This radish is delectable. You want to trade me for this beet.",
  weight: 30, crop_pic_file_name: "tomato-1.jpg", crop_pic_content_type: "image/jpeg", crop_pic_file_size: 10981,
  crop_pic_updated_at: "2015-11-04 20:58:31")
Crop.create!(user_id: 2, crop_type_id: 6, description: "This spinach is delectable. You want to trade me for this beet.",
  weight: 13, crop_pic_file_name: "tomato-1.jpg", crop_pic_content_type: "image/jpeg", crop_pic_file_size: 10981,
  crop_pic_updated_at: "2015-11-04 20:58:31")
Crop.create!(user_id: 3, crop_type_id: 7, description: "This watermelon is delectable. You want to trade me for this beet.",
  weight: 2, crop_pic_file_name: "tomato-1.jpg", crop_pic_content_type: "image/jpeg", crop_pic_file_size: 10981,
  crop_pic_updated_at: "2015-11-04 20:58:31")

TradeType.create!(name: "Crops", description: "Swap for your crops")
TradeType.create!(name: "Time", description: "Swap for your time")
TradeType.create!(name: "Labor", description: "Swap for your labor")

Trade.create!(trade_type_id: 1, crop_id: 1, consumer_id: 2, message: "I'd like to swap for my eggplants.")
Trade.create!(trade_type_id: 2, crop_id: 2, consumer_id: 3, message: "I'd like to swap for my time.")
Trade.create!(trade_type_id: 3, crop_id: 3, consumer_id: 4, message: "I'd like to swap for my labor in the farmer's market.")
