require 'rails_helper'

RSpec.describe Crop, type: :model do
  let(:user) { create(:user) }
  let(:user2) { create(:user, email: "newuser@mail.com") }
  let(:current_user) { create(:user, email: "ruti@mail.com") }
  let!(:crop) { create(:crop, user: user, ripe_on: Date.today - 2.days, expires_on: Date.today + 20.days) }
  let(:crop2) { create(:crop, user: user2, ripe_on: Date.today + 5.days, expires_on: Date.today + 30.days) }
  let(:crop3) { create(:crop, user: user2, expires_on: Date.today + 2.days) }
  let(:expired_crop) { create(:crop, user: user, expires_on: Date.today - 2.days) }
  let(:swap) { create(:swap, crop: crop, accepted: nil) }
  let(:swap2) { create(:swap, crop: crop, accepted: true) }
  let(:wishlist) { create(:wishlist, crop: crop2, user: current_user) }

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

  describe "swaps pending" do
    it "returns swaps that are not yet accepted or rejected" do
      expect(crop.swaps.pending).to eq [swap]
    end
  end

  describe "swaps accepted" do
    it "returns swaps that are accepted" do
      expect(crop.swaps.accepted).to eq [swap2]
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
      available_crop = FactoryGirl.create(:crop, user: user, expires_on: Date.today + 2.days)
      expect(Crop.available_crops(current_user)).to include available_crop
      expect(Crop.available_crops(current_user)).to_not include expired_crop
    end
  end

  describe "#wishlisted?" do
    it "returns true if user has wishlisted the crop" do
      wishlist.reload
      expect(crop.wishlisted?(current_user)).to eq false
      expect(crop2.wishlisted?(current_user)).to eq true
    end
  end
end
