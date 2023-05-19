class StudentApplication < ApplicationRecord
  belongs_to :user
  belongs_to :section

  attr_accessor :temp_grade_received
end
