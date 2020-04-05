class CreateCoins < ActiveRecord::Migration[5.0]
  def change
    create_table :coins do |t|
      t.integer :user_id
      t.integer :coin_count
      
      t.timestamps
    end
  end
end
