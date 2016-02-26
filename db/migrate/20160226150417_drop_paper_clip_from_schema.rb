class DropPaperClipFromSchema < ActiveRecord::Migration
  def change
    remove_column :crops, :crop_pic_file_name
    remove_column :crops, :crop_pic_content_type
    remove_column :crops, :crop_pic_file_size
    remove_column :crops, :crop_pic_updated_at
    remove_column :users, :profile_pic_file_name
    remove_column :users, :profile_pic_content_type
    remove_column :users, :profile_pic_file_size
    remove_column :users, :profile_pic_updated_at
  end
end
