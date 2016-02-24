class RenameTradesTable < ActiveRecord::Migration
  def change
    rename_table :trades, :swaps
    rename_table :trade_types, :swap_types
    rename_column :swaps, :trade_type_id, :swap_type_id
    rename_table :crops_trade_types, :crops_swap_types
    rename_column :crops_swap_types, :trade_type_id, :swap_type_id
    drop_table :sessions
  end
end
