class RemoveRequestingStudent < ActiveRecord::Migration[7.0]
  def change
    remove_column :section_instructors, :requesting_student
  end
end
