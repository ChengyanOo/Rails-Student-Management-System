class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :class_number
      t.string :description
      t.integer :credit_hours
      t.string :class_level
      t.boolean :includes_lab

      t.timestamps
    end
  end
end
