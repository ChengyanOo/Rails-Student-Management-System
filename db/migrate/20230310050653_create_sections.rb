class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.references :course, null: false, foreign_key: true
      t.string :start_time
      t.string :end_time
      t.string :num_of_days
      t.string :campus
      t.string :term
      t.boolean :in_person
      t.integer :graders_needed

      t.timestamps
    end
  end
end
