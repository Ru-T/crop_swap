require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:user2) { create(:user, email: "otheruser@mail.com") }
  let(:crop) { create(:crop, user: user2) }
  let(:crop2) { create(:crop, user: user2) }
  let(:trade) { create(:trade, crop: crop, consumer: user) }
  let(:trade2) { create(:trade, crop: crop2) }
  let(:trade3) { create(:trade, crop: crop, consumer: user, accepted: true) }

  describe "#has_proposed_trade_for?" do
    it "returns trade if user has proposed a trade on the crop" do
      trade.reload
      expect(user.has_proposed_trade_for?(crop)).to eq trade
      expect(user.has_proposed_trade_for?(crop2)).to eq nil
    end
  end

  describe "#has_crop_with_pending_trade?" do
    it "returns true if user has crop with pending trade" do
      trade.reload
      expect(user2.has_crop_with_pending_trade?).to eq true
    end
  end

  describe "#has_crop_without_pending_trade?" do
    it "returns true if user has crop without pending trade" do
      trade3.reload
      expect(user2.has_crop_without_pending_trade?).to eq false
    end
  end
end
