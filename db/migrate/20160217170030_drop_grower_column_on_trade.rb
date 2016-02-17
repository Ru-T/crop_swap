class DropGrowerColumnOnTrade < ActiveRecord::Migration
  def change
    remove_column :trades, :grower_id
  end
end
