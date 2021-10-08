class CreateIteneraries < ActiveRecord::Migration[5.2]
  def change
    create_table :iteneraries do |t|
      t.string :edit_password
      t.string :title

      t.timestamps
    end
  end
end
