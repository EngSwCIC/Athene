class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string :nick, :null => false
      t.string :senha, :null => false
      t.string :email, :null => false

      t.timestamps null: false
    end
  end

  def down
  	drop_table :users
  end
end
