require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:user2) { create(:user, email: "otheruser@mail.com") }
  let(:crop) { create(:crop, user: user2) }
  let(:crop2) { create(:crop, user: user2) }
  let(:trade) { create(:trade, crop: crop, grower: user2, consumer: user) }
  let(:trade2) { create(:trade, crop: crop2, grower: user2) }

  # describe "#has_proposed_trade_for?" do
  #   it "returns true if user has proposed a trade on the crop" do
  #     expect(user.has_proposed_trade_for?(crop)).to eq true
  #     expect(user.has_proposed_trade_for?(crop2)).to eq false
  #   end
  # end
end
