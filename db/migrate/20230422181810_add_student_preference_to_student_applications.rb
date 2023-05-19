class AddStudentPreferenceToStudentApplications < ActiveRecord::Migration[7.0]
  def change
    add_column :student_applications, :student_preference, :integer
  end
end
