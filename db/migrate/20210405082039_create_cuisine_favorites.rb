class CreateCuisineFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :cuisine_favorites do |t|
      t.integer :customer_id
      t.integer :cuisine_id
      t.timestamps
    end
  end
end
