class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, default: ""
      t.string :email, index: true, unique: true, default: ""
      t.string :phone, index: true, unique: true, default: ""
      t.string :password_digest
 
      t.timestamps
    end
  end
end
