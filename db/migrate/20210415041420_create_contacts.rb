class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|

      t.string :email, null: false, default: ""
      t.string :name
      t.text :message
      t.timestamps
    end
  end
end
