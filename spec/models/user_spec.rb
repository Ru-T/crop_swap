require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:user2) { create(:user, email: "otheruser@mail.com") }
  let(:crop) { create(:crop, user: user2) }
  let(:crop2) { create(:crop, user: user2) }
  let(:swap) { create(:swap, crop: crop, consumer: user) }
  let(:swap2) { create(:swap, crop: crop2) }
  let(:swap3) { create(:swap, crop: crop, consumer: user, accepted: true) }

  describe "#has_proposed_swap_for?" do
    it "returns swap if user has proposed a swap on the crop" do
      swap.reload
      expect(user.has_proposed_swap_for?(crop)).to eq swap
      expect(user.has_proposed_swap_for?(crop2)).to eq nil
    end
  end

  describe "#has_crop_with_pending_swap?" do
    it "returns true if user has crop with pending swap" do
      swap.reload
      expect(user2.has_crop_with_pending_swap?).to eq true
    end
  end

  describe "#has_crop_without_pending_swap?" do
    it "returns true if user has crop without pending swap" do
      swap3.reload
      expect(user2.has_crop_without_pending_swap?).to eq false
    end
  end
end
