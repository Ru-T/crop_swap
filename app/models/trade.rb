class Trade < ActiveRecord::Base
  belongs_to :trade_type
  belongs_to :crop
  belongs_to :consumer, class_name: "User"

  has_attached_file :crop_pic
  validates_attachment_content_type :crop_pic, content_type: /\Aimage\/.*\Z/

  before_save :reject_other_trades

  def reject_other_trades
    if self.accepted == true
      Trade.where(crop_id: self.crop_id)
           .where.not(id: self.id)
           .update_all(accepted: false, message_response: "Sorry - another swap was chosen this time.")
    end
  end

  def self.user_has_accepted_trades?
    trades = Trade.all
    if trades.present?
      trades.each { |trade| return true if trade.accepted == true }
      false
    else
      false
    end
  end

  def self.trades(user)
    self.joins(:crop).where(crops: { user_id: user.id }) || self.where(consumer: user)
  end

  def email_trade
    if self.accepted == true
      TradeMailer.accepted_trade(self.consumer.email).deliver_now
    elsif self.accepted == false
      TradeMailer.rejected_trade(self.consumer.email).deliver_now
    else
      TradeMailer.modified_trade(self.crop.user.email).deliver_now
    end
  end

  def email_trade_proposal
    TradeMailer.new_proposed_trade(self.crop.user.email).deliver_now
  end
end
