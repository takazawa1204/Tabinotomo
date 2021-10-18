class AddTagNamesToIteneraries < ActiveRecord::Migration[5.2]
  def change
    add_column :iteneraries, :tag_name, :string
  end
end
