class CreateCuisineComments < ActiveRecord::Migration[5.2]
  def change
    create_table :cuisine_comments do |t|

      t.timestamps
    end
  end
end
