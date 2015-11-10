class Trade < ActiveRecord::Base
  belongs_to :trade_type
  belongs_to :crop
  belongs_to :consumer, class_name: "User"
  belongs_to :grower, class_name: "User"

  before_save :reject_other_trades

  has_attached_file :crop_pic
  validates_attachment_content_type :crop_pic, content_type: /\Aimage\/.*\Z/

  def reject_other_trades
    if self.accepted == true
      Trade.where(crop_id: self.crop_id).where.not(id: self.id).update_all(accepted: false)
    end
  end

  def reject!
    self.update(accepted: false)
  end

end
