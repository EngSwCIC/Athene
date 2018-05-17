class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string :nick, :limit => 30, :null => false
      t.string :senha, :limit => 50, :null => false
      t.string :email, :limit => 20, :null => false

      t.timestamps null: false
    end
  end

  def down
  	drop_table :users
  end
end
