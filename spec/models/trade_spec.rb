require 'rails_helper'

RSpec.describe Trade, type: :model do
  let(:user) { create(:user) }
  let(:user2) { create(:user, email: "consumer1@mail.com") }
  let(:user3) { create(:user, email: "consumer2@mail.com") }
  let(:crop) { create(:crop, user: user) }
  let(:crop2) { create(:crop, user: user2) }
  let(:trade) { create(:trade, crop: crop, consumer: user2, accepted: true) }
  let(:trade2) { create(:trade, crop: crop, consumer: user3) }
  let(:trade3) { create(:trade, crop: crop, consumer: user2, accepted: false) }
  let(:trade4) { create(:trade, crop: crop, consumer: user, accepted: false) }

  describe "#reject!" do
    it "marked the trade as rejected" do
      trade.reject!
      expect(trade.accepted).to eq false
    end
  end

  describe "#reject_other_trades" do
    it "marks all other trades as rejected when one is accepted" do
      t1 = FactoryGirl.create(:trade, crop: crop, consumer: user2)
      t2 = FactoryGirl.create(:trade, crop: crop, consumer: user3)
      t1.accepted = true
      t1.save
      t2.reload
      expect(t2.accepted).to eq false
      expect(t2.message_response). to eq "Sorry - another swap was chosen this time."
    end
  end

  describe ".user_has_accepted_trades" do
    it "returns true if user has accepted trades" do
      trade.reload
      expect(Trade.all.user_has_accepted_trades?).to eq true
    end
  end

  describe ".user_has_rejected_trades" do
    it "returns true if user has rejected trades" do
      trade3.reload
      expect(Trade.all.user_has_rejected_trades?).to eq true
    end
  end

  describe ".trades" do
    it "returns all trades in which current user is involved" do
      expect(Trade.trades(user)).to include trade
      expect(Trade.trades(user)).to include trade4
    end
  end

  describe "#email_trade" do
    it "sends an email when a trade is updated" do
      trade.email_trade
      expect(ActionMailer::Base.deliveries.last.subject). to eq "Your Trade Has Been Accepted!"

      trade3.email_trade
      expect(ActionMailer::Base.deliveries.last.subject). to eq "News About Your Trade"

      trade2.email_trade
      expect(ActionMailer::Base.deliveries.last.subject). to eq "A Pending Trade Has Been Modified"
    end
  end

  describe "#email_trade_proposal" do
    it "sends an email when a trade is updated" do
      trade2.email_trade_proposal
      expect(ActionMailer::Base.deliveries.last.subject). to eq "A New Trade Has Been Proposed!"
    end
  end
end
