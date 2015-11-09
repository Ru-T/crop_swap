class AddColumnsToCrop < ActiveRecord::Migration
  def change
    add_column :crops, :ripe_on, :date
    add_column :crops, :expires_on, :date
  end
end
