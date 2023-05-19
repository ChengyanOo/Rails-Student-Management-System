class DropStudentSchedules < ActiveRecord::Migration[7.0]
  def change
    drop_table :student_schedules
  end
end
