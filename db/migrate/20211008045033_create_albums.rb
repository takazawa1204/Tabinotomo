class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.integer :itenerary_id
      t.integer :image_id
      t.text :albums_comment
      t.string :albums_map

      t.timestamps
    end
  end
end
