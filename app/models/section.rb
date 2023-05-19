class Section < ApplicationRecord
  has_many :section_instructors, dependent: :destroy
  belongs_to :course
end
