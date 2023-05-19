class AddDefaultNilToCourseTaken < ActiveRecord::Migration[7.0]
  def change
    change_column_default :course_takens, :grade_received, nil
  end
end
