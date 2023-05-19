class RemoveInstructorNameFromTableName < ActiveRecord::Migration[7.0]
  def change
    remove_column :sections, :instructor_name, :string
  end
end
