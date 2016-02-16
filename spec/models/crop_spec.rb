require 'rails_helper'

RSpec.describe Crop, type: :model do
  let(:user) { create(:user) }
  let(:user2) { create(:user, email: "newuser@mail.com") }
  let!(:crop) { create(:crop, user: user, ripe_on: Date.today - 2.days, expires_on: Date.today + 20.days) }
  let(:crop2) { create(:crop, user: user, ripe_on: Date.today + 5.days, expires_on: Date.today + 30.days) }
  let(:crop3) { create(:crop, user: user, expires_on: Date.today + 2.days) }
  let(:crop4) { create(:crop, user: user2, expires_on: Date.today + 2.days) }
  let(:crop5) { create(:crop, user: user2, expires_on: Date.today + 2.days) }
  let(:trade) { create(:trade, crop: crop, accepted: nil) }
  let(:trade2) { create(:trade, crop: crop, accepted: true) }
  let(:wishlist) { create(:wishlist, crop: crop, user: user) }

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

  describe "#is_ripe" do
    it "returns true if a crop is ripe and not yet expired" do
      expect(crop.is_ripe?).to eq true
      expect(crop2.is_ripe?).to eq nil
    end
  end

  describe "#about_to_expire" do
    it "returns true if a crop is 3 days or less from expiring" do
      expect(crop2.about_to_expire?).to eq nil
      expect(crop3.about_to_expire?).to eq true
    end
  end

  describe ".available_crops" do
    it "returns all crops that are currently available" do
      expect(Crop.all.available_crops(user)).to eq [crop4, crop5]
    end
  end

  # describe "#wishlisted?" do
  #   it "returns true if user has wishlisted the crop" do
  #     expect(crop.wishlisted?(user)).to eq true
  #     expect(crop2.wishlisted?(user)).to eq false
  #   end
  # end
end
