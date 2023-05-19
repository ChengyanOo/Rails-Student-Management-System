class CreateSectionInstructors < ActiveRecord::Migration[7.0]
  def change
    create_table :section_instructors do |t|
      t.references :instructor, null: false, foreign_key: {to_table: :users}, index: true
      t.references :teaching_assistant, null: false, foreign_key: {to_table: :users}, index: true
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
    remove_foreign_key :section_instructors, :users, column: :instructor_id
    add_foreign_key :section_instructors, :users, column: :instructor_id
    remove_foreign_key :section_instructors, :users, column: :teaching_assistant_id
    add_foreign_key :section_instructors, :users, column: :teaching_assistant_id
  end
end
