class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,               null: false
      t.text   :description,        null: false
      t.integer :category_id,       null: false
      t.integer :product_status_id, null: false
      t.integer :delivery_fee_id,   null: false
      t.integer :profecture_id,     null: false
      t.integer :shipping_date_id,  null: false
      t.integer :price,             null: false
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
