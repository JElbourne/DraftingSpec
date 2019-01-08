class CreateCodeReferences < ActiveRecord::Migration[5.2]
  def change
    create_table :code_references do |t|
      t.string :number
      t.text :body

      t.timestamps
    end
    add_index :code_references, :number
  end
end
