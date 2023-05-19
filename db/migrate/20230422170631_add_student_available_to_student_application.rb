class AddStudentAvailableToStudentApplication < ActiveRecord::Migration[7.0]
  def change
    add_column :student_applications, :student_available, :boolean, default: false
  end
end
