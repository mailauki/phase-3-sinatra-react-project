class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.integer :priority
      t.integer :balance_id
      t.timestamps
    end
  end
end
