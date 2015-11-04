class AddCropTypeToCrop < ActiveRecord::Migration
  def change
    add_column :crops, :crop_type, :integer
  end
end
