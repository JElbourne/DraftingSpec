class CreateReviewAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :review_answers do |t|
      t.string :complete
      t.string :body
      t.string :sheet_number
      t.string :code_reference
      t.references :review_question, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
