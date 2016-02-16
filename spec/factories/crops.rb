FactoryGirl.define do
  factory :crop do
    description "This crop is absolutely delicious"
    weight 12
    crop_type_id 3
    ripe_on Date.today + 1.days
    expires_on Date.today + 3.days
  end
end
