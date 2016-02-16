require 'rails_helper'

RSpec.describe Trade, type: :model do
  let(:user) { create(:user) }
  let(:crop) { create(:crop, user: user) }
  let(:trade) { create(:trade, crop: crop) }
  let(:trade2) { create(:trade, crop: crop) }
  let(:trade3) { create(:trade, crop: crop) }

  describe "#reject!" do
    it "marked the trade as rejected" do
      trade.update(accepted: true)
      trade.reject!
      expect(trade.accepted).to eq false
    end
  end

  describe "#reject_other_trades" do
    it "marks all other trades as rejected when one is accepted" do
      trade.update(accepted: true)
      trade.reject_other_trades
      expect(trade2.accepted).to eq false
      expect(trade3.accepted).to eq false
      expect(trade2.message_response). to eq "Sorry - another swap was chosen this time."
      expect(trade3.message_response). to eq "Sorry - another swap was chosen this time."
    end
  end
end
