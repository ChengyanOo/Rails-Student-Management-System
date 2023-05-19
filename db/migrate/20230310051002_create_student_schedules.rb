class CreateStudentSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :student_schedules do |t|
      t.references :user, null: false, foreign_key: true
      t.string :day
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
