class CreateTeslas < ActiveRecord::Migration
  def change
    create_table :teslas do |t|
      t.string :model
      t.string :trim
      t.decimal :price, :precision => 8, :scale => 2
      t.decimal :insurance, :precision => 8, :scale => 2, default: 0
      t.decimal :maintenance, :precision => 8, :scale => 2, default: 0
      t.decimal :taxes_and_fees, :precision => 8, :scale => 2, default: 0
      t.decimal :financing, :precision => 8, :scale => 2, default: 0
      t.decimal :depreciation, :precision => 8, :scale => 2, default: 0
      t.decimal :fuel, :precision => 8, :scale => 2, default: 0
      t.decimal :tax_credit, :precision => 8, :scale => 2, default: 0
      t.decimal :total, :precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
