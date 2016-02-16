require 'rails_helper'

RSpec.describe Crop, type: :model do
  let(:user) { create(:user) }
  let(:crop) { create(:crop, user: user) }
  let(:trade) { create(:trade, crop: crop, accepted: nil) }
  let(:trade2) { create(:trade, crop: crop, accepted: true) }

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

  describe "trades pending" do
    it "returns trades that are not yet accepted or rejected" do
      expect(crop.trades.pending).to eq [trade]
    end
  end

  describe "trades accepted" do
    it "returns trades that are accepted" do
      expect(crop.trades.accepted).to eq [trade2]
    end
  end
end
