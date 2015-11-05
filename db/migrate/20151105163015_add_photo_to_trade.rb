class AddPhotoToTrade < ActiveRecord::Migration
  def change
    add_attachment :trades, :crop_pic
  end
end
