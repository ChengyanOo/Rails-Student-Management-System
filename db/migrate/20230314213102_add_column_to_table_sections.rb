class AddColumnToTableSections < ActiveRecord::Migration[7.0]
  def change
    add_column :sections, :includes_lab, :boolean
  end
end
