class Swap < ActiveRecord::Base
  belongs_to :swap_type
  belongs_to :crop
  belongs_to :consumer, class_name: "User"

  has_attached_file :crop_pic
  validates_attachment_content_type :crop_pic, content_type: /\Aimage\/.*\Z/

  before_save :reject_other_swaps

  def reject_other_swaps
    if self.accepted == true
      Swap.where(crop_id: self.crop_id)
           .where.not(id: self.id)
           .update_all(accepted: false, message_response: "Sorry - another swap was chosen this time.")
    end
  end

  def self.user_has_accepted_swaps?
    swaps = Swap.all
    if swaps.present?
      swaps.each { |swap| return true if swap.accepted == true }
      false
    else
      false
    end
  end

  def self.swaps(user)
    self.joins(:crop).where(crops: { user_id: user.id }) || self.where(consumer: user)
  end

  def email_swap
    if self.accepted == true
      SwapMailer.accepted_swap(self.consumer.email).deliver_now
    elsif self.accepted == false
      SwapMailer.rejected_swap(self.consumer.email).deliver_now
    else
      SwapMailer.modified_swap(self.crop.user.email).deliver_now
    end
  end

  def email_swap_proposal
    SwapMailer.new_proposed_swap(self.crop.user.email).deliver_now
  end
end
