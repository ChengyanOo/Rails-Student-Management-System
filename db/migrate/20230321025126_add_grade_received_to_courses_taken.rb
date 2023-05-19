class AddGradeReceivedToCoursesTaken < ActiveRecord::Migration[7.0]
  def change
    add_column :course_takens, :grade_received, :string
  end
end
