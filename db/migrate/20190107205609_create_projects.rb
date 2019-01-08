class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name,       null: false
      t.string :address,    null: false
      t.string :filenumber, null: false
      t.references :user,   foreign_key: true

      t.timestamps
    end
    add_index :projects, :filenumber
  end
end
