class CreateCuisineComments < ActiveRecord::Migration[5.2]
  def change
    create_table :cuisine_comments do |t|

      t.text :comment
      t.integer :customer_id
      t.integer :cuisine_id
      t.timestamps
    end
  end
end
