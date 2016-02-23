class ChangeCropTypeColumnOnTrade < ActiveRecord::Migration
  def change
    rename_column :crop_types, :crop_type, :name
  end
end
