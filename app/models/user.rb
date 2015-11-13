class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true

  has_many :trades, foreign_key: "consumer_id"

  has_many :crops

  has_attached_file :profile_pic
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/

  def has_proposed_trade_for?(crop)
    trades.where(crop: crop).first
  end

  def has_crop_with_pending_trade?
    if crops.blank? == false
      crops.each do |crop|
        crop.trades.each do |trade|
          return true if trade.accepted == nil
        end
      end
      false
    else
      false
    end
  end

  def has_crop_without_pending_trade?
    if crops.blank? == false
      crops.each do |crop|
        return true if crop.trades.blank? == true
      end
      false
    else
      false
    end
  end

end
