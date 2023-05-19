class AddInstructionModeToSections < ActiveRecord::Migration[7.0]
  def change
    add_column :sections, :instructionMode, :string
  end
end
