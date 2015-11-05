class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer :trade_type_id
      t.integer :crop_id
      t.integer :consumer_id
      t.boolean :accepted
      t.text :message
      t.text :message_response

      t.timestamps null: false
    end
  end
end
