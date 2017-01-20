class CreateMakes < ActiveRecord::Migration
  def change
    create_table :makes do |t|
      t.integer :edmund_id
      t.string :name
      t.string :nice_name

      t.timestamps null: false
    end
  end
end
