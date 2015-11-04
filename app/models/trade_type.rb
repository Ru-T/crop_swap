class TradeType < ActiveRecord::Base
  has_and_belongs_to_many :crops
end
