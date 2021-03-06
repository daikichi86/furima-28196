class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|

      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.integer :price, null: false
    end
  end
end
