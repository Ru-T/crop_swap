require 'test_helper'

class TradeMailerTest < ActionMailer::TestCase
  test "new_proposed_trade" do
    mail = TradeMailer.new_proposed_trade
    assert_equal "New proposed trade", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "accepted_trade" do
    mail = TradeMailer.accepted_trade
    assert_equal "Accepted trade", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "rejected_trade" do
    mail = TradeMailer.rejected_trade
    assert_equal "Rejected trade", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "modified_trade" do
    mail = TradeMailer.modified_trade
    assert_equal "Modified trade", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
