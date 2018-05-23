class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :video_file
      t.string :file_path

      t.timestamps
    end
  end
end
