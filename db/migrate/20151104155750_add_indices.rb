class AddIndices < ActiveRecord::Migration
  def change
    add_index :crops, :user_id
    add_index :crops, :crop_type_id
  end
end
