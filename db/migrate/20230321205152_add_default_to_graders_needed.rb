class AddDefaultToGradersNeeded < ActiveRecord::Migration[7.0]
  def change
    change_column :sections, :graders_needed, :integer, :default => 1
  end
end
