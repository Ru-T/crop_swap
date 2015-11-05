class Trade < ActiveRecord::Base
  belongs_to :trade_type
  has_attached_file :crop_pic
  # , styles: {
  #   thumb: '100x100>',
  #   square: '200x200#',
  #   medium: '300x300>'
  # }
  validates_attachment_content_type :crop_pic, content_type: /\Aimage\/.*\Z/
end
