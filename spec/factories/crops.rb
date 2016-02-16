FactoryGirl.define do
  factory :crop do
    description "This crop is absolutely delicious"
    weight 12
    crop_type_id 3
    ripe_on Date.today + 10.days
    expires_on Date.today + 15.days
  end
end
