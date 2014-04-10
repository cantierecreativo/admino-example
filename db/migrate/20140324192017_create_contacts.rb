class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.integer :group, null: false, default: 0

      t.timestamps
    end
    add_index :contacts, :email, unique: true
  end
end
