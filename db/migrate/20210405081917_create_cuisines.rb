class CreateCuisines < ActiveRecord::Migration[5.2]
  def change
    create_table :cuisines do |t|

      t.integer :genre_id
      t.integer :customer_id
      t.string :cuisine_name
      t.string :cuisine_image_id
      t.text :material_introduction
      t.text :introduction
      t.string :time



      t.timestamps
    end
  end
end
