class AddCourseEvaluation < ActiveRecord::Migration[7.0]
  def change
    add_column :evaluations, :course_id, :integer
    add_foreign_key :evaluations, :courses, column: :course_id, primary_key: :id, on_delete: :nullify
  end
end
