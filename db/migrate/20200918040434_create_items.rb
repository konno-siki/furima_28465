class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image, null: false
      t.string :item_name, null: false
      t.text :text, null: false
      t.string :category, null: false
      t.integer :status, null: false
      t.integer :fee, null: false
      t.integer :prefecture, null: false
      t.integer :delivery, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
