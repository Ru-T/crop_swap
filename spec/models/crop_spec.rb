require 'rails_helper'

RSpec.describe Crop, type: :model do
  let(:crop) { create(:crop) }

  describe "validations" do
    it "must have user_id to be valid" do
      expect(build(:crop, user_id: nil)).to_not be_valid
    end

    it "must have description to be valid" do
      expect(build(:crop, description: "")).to_not be_valid
    end

    it "must have weight to be valid" do
      expect(build(:crop, weight: "")).to_not be_valid
    end

    it "must have crop type to be valid" do
      expect(build(:crop, crop_type_id: nil)).to_not be_valid
    end

    it "must have ripe on date to be valid" do
      expect(build(:crop, ripe_on: "")).to_not be_valid
    end

    it "must have expiry date to be valid" do
      expect(build(:crop, expires_on: "")).to_not be_valid
    end
  end
end
