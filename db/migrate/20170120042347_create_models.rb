class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :edmund_id
      t.string :name
      t.string :submodel
      t.string :nice_submodel
      t.string :model
      t.string :nice_model
      t.string :years
      t.references :make, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
