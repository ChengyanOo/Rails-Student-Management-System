class CreateStudentGraders < ActiveRecord::Migration[7.0]
  def change
    create_table :student_graders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
