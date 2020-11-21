class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :number, null: false
      t.integer :exp_month, null: false
      t.integer :exp_year, null: false
      t.integer :cvc, null:false

      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
    end
  end
end
