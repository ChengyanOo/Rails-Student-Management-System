class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.integer :instructor_id
      t.integer :grader_id
      t.integer :rating
      t.string :comments

      t.foreign_key :users, column: :grader_id, primary_key: :id
      t.foreign_key :users, column: :instructor_id, primary_key: :id

      t.timestamps
    end
  end
end
