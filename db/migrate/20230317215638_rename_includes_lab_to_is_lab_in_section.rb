class RenameIncludesLabToIsLabInSection < ActiveRecord::Migration[7.0]
  def change
    rename_column :sections, :includes_lab, :is_lab
  end
end
