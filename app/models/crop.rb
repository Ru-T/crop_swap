class Crop < ActiveRecord::Base
  belongs_to :user
  belongs_to :crop_type
  has_and_belongs_to_many :trade_types
  has_many :trades do
    def pending
      where(accepted: nil)
    end
    def accepted
      where(accepted: true)
    end
  end

  validates :user_id, presence: true
  validates :description, presence: true
  validates :weight, presence: true
  validates :crop_type_id, presence: true
  validates :ripe_on, presence: true
  validates :expires_on, presence: true

  has_attached_file :crop_pic
  validates_attachment_content_type :crop_pic, content_type: /\Aimage\/.*\Z/

  # acts_as_mappable

  def is_ripe?
    return true if Date.today >= self.ripe_on && Date.today < self.expires_on
  end

  def about_to_expire?
    return true if Date.today < self.expires_on && Date.today > self.expires_on - 3.days #by less than 3 days
  end

  def self.available_crops(user)
    available_crops = Crop.where('expires_on >= ? AND user_id != ?', Date.today, user.id)
    available_crops.reject { |crop | crop.trades.accepted == true }
    available_crops
  end

  # def self.search(search)
  #   if search
  #     find(:all, :conditions => ['self.crop_type.crop_type LIKE ?', "%#{search}%"])
  #   else
  #     find(:all)
  #   end
  # end
  #
  # def self.sort_by_location
  #   Crop.find(:all, :origin=>self.user.zip_code, :order=>'distance')
  # end

end
