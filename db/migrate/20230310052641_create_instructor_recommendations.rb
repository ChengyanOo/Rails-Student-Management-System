class CreateInstructorRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :instructor_recommendations do |t|
      t.references :instructor, null: false, foreign_key: {to_table: :users}, index: true
      t.references :student, null: false, foreign_key: {to_table: :users}, index: true
      t.references :section, null: false, foreign_key: true
      t.string :date
      t.boolean :student_applied

      t.timestamps
    end
  end
end
