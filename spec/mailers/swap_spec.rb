require "rails_helper"

RSpec.describe SwapMailer, type: :mailer do
  let(:user) { create(:user) }

  describe "#new_proposed_swap" do
    it "alerts a grower to a new proposed swap" do
      new_proposed_swap = SwapMailer.new_proposed_swap(user.email).deliver_now
      expect(ActionMailer::Base.deliveries).to_not be_empty

      expect(new_proposed_swap.from).to eq ["cropswap@cropswap.com"]
      expect(new_proposed_swap.to).to eq [user.email]
      expect(new_proposed_swap.subject).to eq "A New swap Has Been Proposed!"
    end
  end

  describe "#accepted_swap" do
    it "lets a consumer know a swap has been accepted" do
      accepted_swap = SwapMailer.accepted_swap(user.email).deliver_now
      expect(ActionMailer::Base.deliveries).to_not be_empty

      expect(accepted_swap.from).to eq ["cropswap@cropswap.com"]
      expect(accepted_swap.to).to eq [user.email]
      expect(accepted_swap.subject).to eq "Your swap Has Been Accepted!"
    end
  end

  describe "#rejected_swap" do
    it "lets a consumer know a swap has been rejected" do
      rejected_swap = SwapMailer.rejected_swap(user.email).deliver_now
      expect(ActionMailer::Base.deliveries).to_not be_empty

      expect(rejected_swap.from).to eq ["cropswap@cropswap.com"]
      expect(rejected_swap.to).to eq [user.email]
      expect(rejected_swap.subject).to eq "News About Your swap"
    end
  end

  describe "#modified_swap" do
    it "lets a consumer know a swap has been modified" do
      modified_swap = SwapMailer.modified_swap(user.email).deliver_now
      expect(ActionMailer::Base.deliveries).to_not be_empty

      expect(modified_swap.from).to eq ["cropswap@cropswap.com"]
      expect(modified_swap.to).to eq [user.email]
      expect(modified_swap.subject).to eq "A Pending swap Has Been Modified"
    end
  end
end
