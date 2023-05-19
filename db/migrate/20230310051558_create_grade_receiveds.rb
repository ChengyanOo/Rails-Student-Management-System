class CreateGradeReceiveds < ActiveRecord::Migration[7.0]
  def change
    create_table :grade_receiveds do |t|
      t.references :completed_course, null: false, foreign_key: {to_table: :course_taken}
      t.integer :grade

      t.timestamps
    end
  end
end
