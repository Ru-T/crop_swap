require 'rails_helper'

RSpec.describe Swap, type: :model do
  let(:user) { create(:user) }
  let(:user2) { create(:user, email: "consumer1@mail.com") }
  let(:user3) { create(:user, email: "consumer2@mail.com") }
  let(:crop) { create(:crop, user: user) }
  let(:crop2) { create(:crop, user: user2) }
  let(:swap) { create(:swap, crop: crop, consumer: user2, accepted: true) }
  let(:swap2) { create(:swap, crop: crop, consumer: user3) }
  let(:swap3) { create(:swap, crop: crop, consumer: user2, accepted: false) }
  let(:swap4) { create(:swap, crop: crop, consumer: user, accepted: false) }

  describe "#reject_other_swaps" do
    it "marks all other swaps as rejected when one is accepted" do
      t1 = FactoryGirl.create(:swap, crop: crop, consumer: user2)
      t2 = FactoryGirl.create(:swap, crop: crop, consumer: user3)
      t1.accepted = true
      t1.save
      t2.reload
      expect(t2.accepted).to eq false
      expect(t2.message_response). to eq "Sorry - another swap was chosen this time."
    end
  end

  describe ".user_has_accepted_swaps" do
    it "returns true if user has accepted swaps" do
      swap.reload
      expect(Swap.all.user_has_accepted_swaps?).to eq true
    end
  end

  describe ".swaps" do
    it "returns all swaps in which current user is involved" do
      expect(Swap.swaps(user)).to include swap
      expect(Swap.swaps(user)).to include swap4
    end
  end

  describe "#email_swap" do
    it "sends an email when a swap is updated" do
      swap.email_swap
      expect(ActionMailer::Base.deliveries.last.subject). to eq "Your Swap Has Been Accepted!"

      swap3.email_swap
      expect(ActionMailer::Base.deliveries.last.subject). to eq "News About Your Swap"

      swap2.email_swap
      expect(ActionMailer::Base.deliveries.last.subject). to eq "A Pending Swap Has Been Modified"
    end
  end

  describe "#email_swap_proposal" do
    it "sends an email when a swap is updated" do
      swap2.email_swap_proposal
      expect(ActionMailer::Base.deliveries.last.subject). to eq "A New Swap Has Been Proposed!"
    end
  end
end
