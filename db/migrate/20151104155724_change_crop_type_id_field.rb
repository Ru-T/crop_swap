class ChangeCropTypeIdField < ActiveRecord::Migration
  def change
    rename_column :crops, :crop_type, :crop_type_id
  end
end
