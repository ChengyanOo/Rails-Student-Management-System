class DropGradeReceived < ActiveRecord::Migration[7.0]
  def change
    drop_table :grade_receiveds
  end
end
