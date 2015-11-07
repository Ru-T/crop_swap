class Trade < ActiveRecord::Base
  belongs_to :trade_type
  belongs_to :crop
  belongs_to :consumer, class_name: "User"
  belongs_to :grower, class_name: "User"

  has_attached_file :crop_pic
  validates_attachment_content_type :crop_pic, content_type: /\Aimage\/.*\Z/


  # def reject_other_trades(crop)
  #   r = []
  #   crop.trades.each do |t|
  #     r << t.where(:accepted.blank?)
  #     r.each do |r|
  #       r.accepted = false
  #     end
  #   end
  # end
  #
  # def rejected_trade(crop)
  #   if crop.trades.blank? == false
  #     crop.trades.each do |t|
  #       break if t.accepted == false
  #     end
  #   end
  # end
  #
  # def pending_trade(crop)
  #   if crop.trades.blank? == false
  #     crop.trades.each do |t|
  #       t.accepted != true && t.accepted != false
  #     end
  #   end
  # end

end
