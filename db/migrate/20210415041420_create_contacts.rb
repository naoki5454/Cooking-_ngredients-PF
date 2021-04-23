class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|

      t.integer :customer_id
      t.string :name
      t.text :message
      t.boolean :is_valid, default: true, null: false
      t.timestamps
    end
  end
end
