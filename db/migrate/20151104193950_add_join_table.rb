class AddJoinTable < ActiveRecord::Migration
  def change
    create_join_table :crops, :trade_types
  end
end
