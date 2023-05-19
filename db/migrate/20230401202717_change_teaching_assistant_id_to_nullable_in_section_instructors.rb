class ChangeTeachingAssistantIdToNullableInSectionInstructors < ActiveRecord::Migration[7.0]
  def change
    change_column :section_instructors, :teaching_assistant_id, :integer, null: true
  end
end
