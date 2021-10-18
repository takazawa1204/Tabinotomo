class AddImageToAlbum < ActiveRecord::Migration[5.2]
  def change
    change_column :albums, :image_id, :string
  end
end
