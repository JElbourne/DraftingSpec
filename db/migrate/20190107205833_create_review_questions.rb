class CreateReviewQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :review_questions do |t|
      t.string :body
      t.string :code_reference
      t.integer :order
      t.references :review_category, foreign_key: true

      t.timestamps
    end
    add_index :review_questions, :order
  end
end
