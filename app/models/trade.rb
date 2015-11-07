class Trade < ActiveRecord::Base
  belongs_to :trade_type
  belongs_to :crop
  belongs_to :consumer, class_name: "User"
  belongs_to :grower, class_name: "User"

  has_attached_file :crop_pic
  validates_attachment_content_type :crop_pic, content_type: /\Aimage\/.*\Z/

  def reject_other_trades
  #   if any trades for this crop is accepted
  #     mark all other as false

  end

end
