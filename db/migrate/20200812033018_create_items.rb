class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                  null: false
      t.text :descreption,             null: false
      t.integer :category,            null: false
      t.integer :status,              null: false
      t.integer :shipping_fee_burden, null: false
      t.integer :shipping_region,     null: false
      t.integer :deys_until_shipping, null: false
      t.integer :price,               null: false
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
