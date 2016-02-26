class AddAvatarToCrops < ActiveRecord::Migration
  def change
    add_column :crops, :avatar, :string
  end
end
