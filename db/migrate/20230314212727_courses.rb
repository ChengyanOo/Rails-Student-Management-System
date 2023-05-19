class Courses < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses, :includes_lab, :boolean
  end
end
