class InstructorRecommendation < ApplicationRecord
  belongs_to :instructor, class_name: 'User', foreign_key: 'instructor_id'
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :section
end
