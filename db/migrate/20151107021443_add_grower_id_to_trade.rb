class AddGrowerIdToTrade < ActiveRecord::Migration
  def change
    add_column :trades, :grower_id, :integer
  end
end
