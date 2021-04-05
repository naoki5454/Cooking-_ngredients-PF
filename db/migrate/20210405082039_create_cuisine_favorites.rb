class CreateCuisineFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :cuisine_favorites do |t|

      t.timestamps
    end
  end
end
