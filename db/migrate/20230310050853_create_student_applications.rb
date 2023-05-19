class CreateStudentApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :student_applications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
      t.string :date

      t.timestamps
    end
  end
end
