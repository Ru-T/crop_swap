require "rails_helper"

RSpec.describe TradeMailer, type: :mailer do
  let(:user) { create(:user) }

  describe "#new_proposed_trade" do
    it "alerts a grower to a new proposed trade" do
      new_proposed_trade = TradeMailer.new_proposed_trade(user.email).deliver_now
      expect(ActionMailer::Base.deliveries).to_not be_empty

      expect(new_proposed_trade.from).to eq ["cropswap@cropswap.com"]
      expect(new_proposed_trade.to).to eq [user.email]
      expect(new_proposed_trade.subject).to eq "A New Trade Has Been Proposed!"
    end
  end

  describe "#accepted_trade" do
    it "lets a consumer know a trade has been accepted" do
      accepted_trade = TradeMailer.accepted_trade(user.email).deliver_now
      expect(ActionMailer::Base.deliveries).to_not be_empty

      expect(accepted_trade.from).to eq ["cropswap@cropswap.com"]
      expect(accepted_trade.to).to eq [user.email]
      expect(accepted_trade.subject).to eq "Your Trade Has Been Accepted!"
    end
  end

  describe "#rejected_trade" do
    it "lets a consumer know a trade has been rejected" do
      rejected_trade = TradeMailer.rejected_trade(user.email).deliver_now
      expect(ActionMailer::Base.deliveries).to_not be_empty

      expect(rejected_trade.from).to eq ["cropswap@cropswap.com"]
      expect(rejected_trade.to).to eq [user.email]
      expect(rejected_trade.subject).to eq "News About Your Trade"
    end
  end

  describe "#modified_trade" do
    it "lets a consumer know a trade has been modified" do
      modified_trade = TradeMailer.modified_trade(user.email).deliver_now
      expect(ActionMailer::Base.deliveries).to_not be_empty

      expect(modified_trade.from).to eq ["cropswap@cropswap.com"]
      expect(modified_trade.to).to eq [user.email]
      expect(modified_trade.subject).to eq "A Pending Trade Has Been Modified"
    end
  end
end
