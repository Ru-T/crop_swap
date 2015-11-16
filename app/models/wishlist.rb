class Wishlist < ActiveRecord::Base
  belongs_to :crop
  belongs_to :user

end
