class TradeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trade_mailer.new_proposed_trade.subject
  #
  def new_proposed_trade
    @greeting = "Hi"

    mail to: "rwajnberg@gmail.com", subject: "A New Trade Has Been Proposed!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trade_mailer.accepted_trade.subject
  #
  def accepted_trade
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trade_mailer.rejected_trade.subject
  #
  def rejected_trade
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trade_mailer.modified_trade.subject
  #
  def modified_trade
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
