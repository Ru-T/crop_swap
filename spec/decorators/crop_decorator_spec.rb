require 'rails_helper'

describe CropDecorator do
  let!(:crop) { create(:crop, user: user, ripe_on: Date.today - 2.days, expires_on: Date.today + 20.days).decorate }
  let(:crop2) { create(:crop, user: user2, ripe_on: Date.today + 5.days, expires_on: Date.today + 30.days).decorate }
  let(:crop3) { create(:crop, user: user2, expires_on: Date.today + 2.days).decorate }
  let(:user) { create(:user) }
  let(:user2) { create(:user, email: "newuser@mail.com") }
  let(:current_user) { create(:user, email: "ruti@mail.com") }
  let(:wishlist) { create(:wishlist, crop: crop2, user: current_user) }

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

  describe "#has_pic?" do
    it "returns true if crop has an image" do
      expect(crop.has_pic?).to eq false
    end
  end

  describe "time methods for views" do
    it "returns the time in which crop will be ripe" do
      expect(crop.ripe_time).to eq "2 days"
      expect(crop2.ripe_time).to eq "5 days"
      expect(crop3.ripe_time).to eq "1 day"
    end

    it "returns the time in which crop will expire" do
      expect(crop.expiry_time).to eq "20 days"
      expect(crop2.expiry_time).to eq "30 days"
      expect(crop3.expiry_time).to eq "1 day"
    end

    it "returns the time ago in which crop was created" do
      expect(crop.created_time).to eq "6 days"
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
