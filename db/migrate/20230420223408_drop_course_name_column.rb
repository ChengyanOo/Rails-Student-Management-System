class DropCourseNameColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :evaluations, :course_number
  end
end
