class RemoveinPersonFromSections < ActiveRecord::Migration[7.0]
  def change
    remove_column :sections, :in_person, :boolean
  end
end
