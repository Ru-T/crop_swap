require 'rails_helper'

RSpec.describe Trade, type: :model do
  let(:user) { create(:user) }
  let(:user2) { create(:user, email: "consumer1@mail.com") }
  let(:user3) { create(:user, email: "consumer2@mail.com") }
  let(:crop) { create(:crop, user: user) }
  let(:trade) { create(:trade, crop: crop, consumer: user2, grower: user, accepted: true) }
  let(:trade2) { create(:trade, crop: crop, consumer: user3, grower: user) }

  describe "#reject!" do
    it "marked the trade as rejected" do
      trade.reject!
      expect(trade.accepted).to eq false
    end
  end

  describe "#reject_other_trades" do
    it "marks all other trades as rejected when one is accepted" do
      trade.reject_other_trades
      trade2.reload
      expect(trade2.accepted).to eq false
      expect(trade2.message_response). to eq "Sorry - another swap was chosen this time."
    end
  end

  describe ".user_has_accepted_trades" do
    it "returns true if user has accepted trades" do
      expect(Trade.all.user_has_accepted_trades?).to eq true
    end
  end

  describe ".user_has_rejected_trades" do
    it "returns true if user has rejected trades" do
      expect(Trade.all.user_has_rejected_trades?).to eq false
    end
  end
end
