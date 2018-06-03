class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.integer :user
      t.string :title
      t.text :description
      t.string :file_path

      t.timestamps
    end
  end
end
