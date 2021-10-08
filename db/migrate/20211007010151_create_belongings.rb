class CreateBelongings < ActiveRecord::Migration[5.2]
  def change
    create_table :belongings do |t|
      t.string :belongings_name
      t.integer :itenerary_id

      t.timestamps
    end
  end
end
