class AddDaysToSections < ActiveRecord::Migration[7.0]
  def change
    add_column :sections, :sunday, :boolean
    add_column :sections, :monday, :boolean
    add_column :sections, :tuesday, :boolean
    add_column :sections, :wednesday, :boolean
    add_column :sections, :thursday, :boolean
    add_column :sections, :friday, :boolean
    add_column :sections, :saturday, :boolean
  end
end
