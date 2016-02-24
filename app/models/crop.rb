class Crop < ActiveRecord::Base
  belongs_to :user
  belongs_to :crop_type

  has_and_belongs_to_many :swap_types
  has_many :wishlists
  has_many :swaps do
    def pending
      where(accepted: nil)
    end
    def accepted
      where(accepted: true)
    end
  end

  validates_presence_of :user_id, :description, :weight, :crop_type_id, :ripe_on, :expires_on

  has_attached_file :crop_pic
  validates_attachment_content_type :crop_pic, content_type: /\Aimage\/.*\Z/

  def is_ripe?
    return true if Date.today >= self.ripe_on && Date.today < self.expires_on
  end

  def about_to_expire?
    return true if Date.today < self.expires_on && Date.today > self.expires_on - 3.days
  end

  def self.available_crops(user)
    available_crops = Crop.where('expires_on >= ? AND user_id != ?', Date.today, user.id)
    available_crops.reject { |crop | crop.swaps.accepted == true }
    available_crops
  end

  def wishlisted?(user)
    if self.wishlists.present?
      self.wishlists.each { |wishlist| return true if wishlist.user == user }
    end
    false
  end
end
