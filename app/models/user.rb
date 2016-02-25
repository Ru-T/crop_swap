class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :swaps, foreign_key: "consumer_id"
  has_many :crops
  has_many :wishlists

  has_attached_file :profile_pic
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/

  def has_proposed_swap_for?(crop)
    swaps.where(crop_id: crop.id).first
  end

  def has_crop_with_pending_swap?
    if crops.present?
      crops.each do |crop|
        crop.swaps.each { |swap| return true if swap.accepted == nil }
      end
      false
    else
      false
    end
  end

  def has_crop_without_pending_swap?
    if crops.present?
      crops.each { |crop| return true if crop.swaps.blank? == true }
      false
    else
      false
    end
  end
end
