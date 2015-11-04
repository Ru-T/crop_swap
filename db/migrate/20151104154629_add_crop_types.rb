class AddCropTypes < ActiveRecord::Migration
  def change
    create_table :crop_types do |t|
      t.string :crop_type

      t.timestamps null: false
    end
  end
end
