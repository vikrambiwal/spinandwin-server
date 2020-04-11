class CreateRedeems < ActiveRecord::Migration[5.0]
  def change
    create_table :redeems do |t|
      t.integer :user_id
      t.string :phone, default: ""
      t.string :amount, default: ""
      
      t.timestamps
    end
  end
end
