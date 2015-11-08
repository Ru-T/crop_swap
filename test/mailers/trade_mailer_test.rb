require 'test_helper'

class TradeMailerTest < ActionMailer::TestCase
  test "new_proposed_trade" do
    mail = TradeMailer.new_proposed_trade(email)
    assert_equal "A New Trade Has Been Proposed!", mail.subject
    assert_equal [email], mail.to
    assert_equal ["cropswap@cropswap.com"], mail.from
    assert_match "a new trade", mail.body.encoded
  end

  test "accepted_trade" do
    mail = TradeMailer.accepted_trade(email)
    assert_equal "Your Trade Has Been Accepted!", mail.subject
    assert_equal [email], mail.to
    assert_equal ["cropswap@cropswap.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "rejected_trade" do
    mail = TradeMailer.rejected_tradee(email)
    assert_equal "News About Your Trade", mail.subject
    assert_equal [email], mail.to
    assert_equal ["cropswap@cropswap.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "modified_trade" do
    mail = TradeMailer.modified_trade(email)
    assert_equal "A Pending Trade Has Been Modified", mail.subject
    assert_equal [email], mail.to
    assert_equal ["cropswap@cropswap.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
