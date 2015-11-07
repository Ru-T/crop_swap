class Crop < ActiveRecord::Base
  belongs_to :user
  belongs_to :crop_type
  has_and_belongs_to_many :trade_types
  has_many :trades

  validates :user_id, presence: true
  validates :description, presence: true
  validates :weight, presence: true
  validates :crop_type_id, presence: true

  #validates :trade_types, presence: true

  has_attached_file :crop_pic
  validates_attachment_content_type :crop_pic, content_type: /\Aimage\/.*\Z/

end
