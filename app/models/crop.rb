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
    def rejected
      where(accepted: false)
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

  def is_ripe?
    return true if Date.today >= self.ripe_on && Date.today < self.expires_on
  end

  def about_to_expire?
    return true if Date.today < self.expires_on && Date.today > self.expires_on - 3.days #by less than 3 days
  end

end
