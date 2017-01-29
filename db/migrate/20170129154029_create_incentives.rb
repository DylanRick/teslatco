class CreateIncentives < ActiveRecord::Migration
  def change
    create_table :incentives do |t|
      t.string :state
      t.string :state_code
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
