class AddIndicesAgain < ActiveRecord::Migration
  def change
    def change
      add_index :trades, :user_id
      add_index :trades, :trade_type_id
      add_index :trades, :crop_id
    end
  end
end
