# Preview all emails at http://localhost:3000/rails/mailers/trade_mailer
class TradeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/trade_mailer/new_proposed_trade
  def new_proposed_trade
    TradeMailer.new_proposed_trade
  end

  # Preview this email at http://localhost:3000/rails/mailers/trade_mailer/accepted_trade
  def accepted_trade
    TradeMailer.accepted_trade
  end

  # Preview this email at http://localhost:3000/rails/mailers/trade_mailer/rejected_trade
  def rejected_trade
    TradeMailer.rejected_trade
  end

  # Preview this email at http://localhost:3000/rails/mailers/trade_mailer/modified_trade
  def modified_trade
    TradeMailer.modified_trade
  end

end
