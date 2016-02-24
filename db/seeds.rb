User.create!(email: "dan@mail.com", name: "Dan the Farmer", password: "password",
  description: "I am a farmer living in the Hillsborough area. I have been in agriculture for the last 25 years. Currently, I grow a variety of seasonal vegatbles and I am excited to swap!",
  zip_code: 27278, phone_number: "555-555-5555")
User.create!(email: "joelle@mail.com", name: "Joelle B.", password: "password",
  description: "I am a responsible consumer living in Durham, NC. I try to buy my product directly from farmers wherever possible. I have several years of volunteer experience in Farmers Markets, and I am excited to swap my time for your crops!",
  zip_code: 27701, phone_number: "555-555-5555")
User.create!(email: "josie@mail.com", name: "Josie the Gardener", password: "password",
  description: "I am a backyard grower living north of Raleigh. I keep chickens and bees and grow a variety of seasonal greens, including spinach and collards.",
  zip_code: 27587, phone_number: "555-555-5555")
User.create!(email: "jamie@mail.com", name: "Jamie M.", password: "password",
  description: "I am a farmer's market addict living in Carrboro. I love to spend hours perusing the fresh produce of my agricultural neighbors. I am excited to swap my time or labor for fresh veggies that would otherwise go to waste!",
  zip_code: 27510, phone_number: "555-555-5555")
User.create!(email: "farmer@mail.com", name: "Fred the Farmer", password: "password",
  description: "I am a farmer that grows primarily radishes and potatoes out of my north Durham acreage. I often have a surplus that I'll feed to my goats - I'm excited to swap them instead!",
  zip_code: 27701, phone_number: "555-555-5555")
User.create!(email: "steve@mail.com", name: "Steve W.", password: "password",
  description: "I am a vegan food lover who believes passionately in local sourcing. I am so excited to check out what my farmers have to swap!",
  zip_code: 27278, phone_number: "555-555-5555")

CropType.create!(name: "Beet")
CropType.create!(name: "Blueberries")
CropType.create!(name: "Bok Choy")
CropType.create!(name: "Brussel Sprouts")
CropType.create!(name: "Butternut Squash")
CropType.create!(name: "Carrot")
CropType.create!(name: "Cauliflower")
CropType.create!(name: "Collard Greens")
CropType.create!(name: "Eggplant")
CropType.create!(name: "Garlic")
CropType.create!(name: "Potato")
CropType.create!(name: "Radish")
CropType.create!(name: "Spinach")
CropType.create!(name: "Strawberries")
CropType.create!(name: "Tomato")

tt1 = SwapType.create!(name: "Crops")
tt2 = SwapType.create!(name: "Time")
tt3 = SwapType.create!(name: "Labor")

c1 = Crop.create!(user_id: 1, crop_type_id: 11, description: "I have three pounds of delicious red potatoes - perfect for a winter stew!",
  weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today + 8.days)
c2 = Crop.create!(user_id: 1, crop_type_id: 15, description: "Juicy tomatoes available to swap! All colors and sizes.",
  weight: 2, ripe_on: Date.today + 3.days, expires_on: Date.today + 10.days)
c3 = Crop.create!(user_id: 1, crop_type_id: 1, description: "Check out these beets - the greens make a delicious pesto.",
  weight: 4, ripe_on: Date.today + 5.days, expires_on: Date.today + 12.days)
c4 = Crop.create!(user_id: 1, crop_type_id: 6, description: "The perfect carrots to snack on with some ranch dressing.",
  weight: 5, ripe_on: Date.today - 2.days, expires_on: Date.today + 2.days)
c5 = Crop.create!(user_id: 1, crop_type_id: 12, description: "Radishes - my favorite. Roast em in the oven with some cumin!",
  weight: 2, ripe_on: Date.today + 13.days, expires_on: Date.today + 23.days)

c6 = Crop.create!(user_id: 3, crop_type_id: 13, description: "Spinach is the perfect vegetable for a stir fry or a salad.",
  weight: 4, ripe_on: Date.today + 7.days, expires_on: Date.today + 10.days)
c7 = Crop.create!(user_id: 3, crop_type_id: 8, description: "Seasonal collard greens - great for mixing into grits.",
  weight: 2, ripe_on: Date.today + 24.days, expires_on: Date.today + 29.days)
c8 = Crop.create!(user_id: 3, crop_type_id: 3, description: "Bok choy - the ideal stir fry green. Throw in some soy sauce!",
  weight: 3, ripe_on: Date.today - 2.days, expires_on: Date.today + 8.days)

c9 = Crop.create!(user_id: 5, crop_type_id: 2, description: "Blueberries are almost out of season - grab some today!",
  weight: 2, ripe_on: Date.today + 3.days, expires_on: Date.today + 13.days)
c10 = Crop.create!(user_id: 5, crop_type_id: 7, description: "Grab some cauliflower and throw em in the oven.",
  weight: 4, ripe_on: Date.today - 3.days, expires_on: Date.today + 3.days)
c11 = Crop.create!(user_id: 5, crop_type_id: 9, description: "Eggplants make any dish more beautiful - and delicious!",
  weight: 1, ripe_on: Date.today - 2.days, expires_on: Date.today + 2.days)

c12 = Crop.create!(user_id: 5, crop_type_id: 5, description: "Butternut squash is the perfect base for a winter soup.",
weight: 2, ripe_on: Date.today + 3.days, expires_on: Date.today + 10.days)
c13 = Crop.create!(user_id: 5, crop_type_id: 4, description: "Delicious brussel sprouts - save the stalk for a stock!",
weight: 4, ripe_on: Date.today + 3.days, expires_on: Date.today + 13.days)
c14 = Crop.create!(user_id: 5, crop_type_id: 10, description: "Garlic - a necessary ingredient for any meal worth serving.",
weight: 1, ripe_on: Date.today - 2.days, expires_on: Date.today + 2.days)
c15 = Crop.create!(user_id: 5, crop_type_id: 14, description: "Strawberries - last of the season! Get em while you can.",
  weight: 2, ripe_on: Date.today - 1.days, expires_on: Date.today + 3.days)
c16 = Crop.create!(user_id: 5, crop_type_id: 6, description: "Grab these carrots and put them in a pot.",
  weight: 4, ripe_on: Date.today + 3.days, expires_on: Date.today + 13.days)
c17 = Crop.create!(user_id: 5, crop_type_id: 15, description: "Tomatoes are perfect for any salad, stew, or stir fry.",
  weight: 4, ripe_on: Date.today + 13.days, expires_on: Date.today + 23.days)

c1.swap_types << tt1
c1.save

c2.swap_types << tt1
c2.swap_types << tt2
c2.save

c3.swap_types << tt1
c3.swap_types << tt2
c3.swap_types << tt3
c3.save

c4.swap_types << tt1
c4.swap_types << tt2
c4.save

c5.swap_types << tt1
c5.swap_types << tt2
c5.swap_types << tt3
c5.save

c6.swap_types << tt1
c6.swap_types << tt2
c6.swap_types << tt3
c6.save

c7.swap_types << tt1
c7.swap_types << tt3
c7.save

c8.swap_types << tt1
c8.swap_types << tt3
c8.save

c9.swap_types << tt1
c9.swap_types << tt2
c9.swap_types << tt3
c9.save

c10.swap_types << tt1
c10.swap_types << tt2
c10.save

c11.swap_types << tt1
c11.swap_types << tt3
c11.save

Swap.create!(swap_type_id: 1, crop_id: 1, consumer_id: 2, message: "Hi! I'd love to offer up some shishito peppers I've been growing in my backyard in exchange for your potatoes.")
Swap.create!(swap_type_id: 1, crop_id: 1, consumer_id: 3, message: "Hey there! I have a lot of excess seasonal greens and would be happy to swap some for your amazing potatoes.")
Swap.create!(swap_type_id: 2, crop_id: 2, consumer_id: 4, message: "Hey there. I'd be happy to swap my time for your delicious-looking tomatoes. I could help with the Farmer's Market this Saturday if that works for you.")
Swap.create!(swap_type_id: 1, crop_id: 6, consumer_id: 1, message: "Spinach is my favorite. I have lots of seasonal vegetables I can swap - check out my profile and let me know what you want!")
Swap.create!(swap_type_id: 2, crop_id: 6, consumer_id: 4, message: "I'd be happy to swap my time for your delicious looking spinach. I am free this weekend if you need some help with markets.")
Swap.create!(swap_type_id: 3, crop_id: 6, consumer_id: 6, message: "I'm eager to lend a hand in exchange for this yummy-looking spinach. How's this weekend?")
Swap.create!(swap_type_id: 1, crop_id: 11, consumer_id: 5, message: "Hi - I'm also a farmer and have some dikon radishes I'd be happy to swap for your eggplants")
Swap.create!(swap_type_id: 3, crop_id: 11, consumer_id: 2, message: "Nice to meet you - need any help on your land this month in exchange for those yummy eggplants?")
