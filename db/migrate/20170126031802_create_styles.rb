class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.integer :year
      t.string :edmund_id
      t.string :price
      t.string :trim
      t.string :style_long_name
      t.references :model, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
