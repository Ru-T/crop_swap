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

  def reject!
    self.update(accepted: false)
  end

  def self.user_has_accepted_trades?
    trades = Trade.all
    if trades.blank? == false
      trades.each do |trade|
        return true if trade.accepted == true
      end
      false
    else
      false
    end
  end

  def self.user_has_rejected_trades?
    trades = Trade.all
    if trades.blank? == false
      trades.each do |trade|
        return true if trade.accepted == false
      end
      false
    else
      false
    end
  end

  def self.current_user_trades(user)
    self.joins(:crop).where(crops: { user_id: user.id }) || self.where(consumer: user) 
  end
end
