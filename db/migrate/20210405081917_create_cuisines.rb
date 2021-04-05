class CreateCuisines < ActiveRecord::Migration[5.2]
  def change
    create_table :cuisines do |t|

      t.string :cuisine_name
      t.string :cuisine_image_id
      t.text :introduction
      t.string :time



      t.timestamps
    end
  end
end
