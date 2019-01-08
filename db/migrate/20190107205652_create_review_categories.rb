class CreateReviewCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :review_categories do |t|
      t.string :name
      t.integer :order
      t.timestamps
    end
    add_index :review_categories, :order
  end
end
