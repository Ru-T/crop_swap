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

end
