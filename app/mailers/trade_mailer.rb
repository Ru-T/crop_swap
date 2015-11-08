class TradeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trade_mailer.new_proposed_trade.subject
  #
  def new_proposed_trade(email)
    @greeting = "Hi"

    mail to: email, subject: "A New Trade Has Been Proposed!",
    from: "cropswap@cropswap.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trade_mailer.accepted_trade.subject
  #
  def accepted_trade(email)
    @greeting = "Hi"

    mail to: email, subject: "Your Trade Has Been Accepted!",
    from: "cropswap@cropswap.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trade_mailer.rejected_trade.subject
  #
  def rejected_trade(email)
    @greeting = "Hi"

    mail to: email, subject: "News About Your Trade",
    from: "cropswap@cropswap.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trade_mailer.modified_trade.subject
  #
  def modified_trade(email)
    @greeting = "Hi"

    mail to: email, subject: "A Pending Trade Has Been Modified",
    from: "cropswap@cropswap.com"
  end
end
