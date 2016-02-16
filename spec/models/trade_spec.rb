require 'rails_helper'

RSpec.describe Trade, type: :model do
  let(:trade) { create(:trade) }

  describe "#reject" do
    it "marked the trade as rejected" do
      trade.update(accepted: true)
      trade.reject!
      expect(trade.accepted).to eq false
    end
  end
end
