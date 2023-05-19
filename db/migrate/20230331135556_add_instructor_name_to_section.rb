class AddInstructorNameToSection < ActiveRecord::Migration[7.0]
  def change
    add_column :sections, :instructor_name, :string
  end
end
