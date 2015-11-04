class AddProfilePictoUsers < ActiveRecord::Migration
  def change
    add_attachment :users, :profile_pic
    add_attachment :crops, :crop_pic
  end
end
