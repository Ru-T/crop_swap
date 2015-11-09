class Crop < ActiveRecord::Base
  belongs_to :user
  belongs_to :crop_type
  has_and_belongs_to_many :trade_types
  has_many :trades

  validates :user_id, presence: true
  validates :description, presence: true
  validates :weight, presence: true
  validates :crop_type_id, presence: true
  validates :ripe_on, presence: true
  validates :expires_on, presence: true

  #validates :trade_types, presence: true

  has_attached_file :crop_pic
  validates_attachment_content_type :crop_pic, content_type: /\Aimage\/.*\Z/

  # def reject_other_trades
  #   c = Crop.find(id: crop.id)
  #   c.trades.each do |t|
  #     if t.accepted == true
  #
  # end

  # def accepted_trade(crop)
  #   if crop.trades.blank? == false
  #     crop.trades.each do |t|
  #       return true if t.accepted == true
  #     end
  #   end
  # end

  # def pending_trade(crop)
  #   crop.trades.each do |t|
  #     return true if t.consumer_id == @current_user.id
  #   end
  # end

end
