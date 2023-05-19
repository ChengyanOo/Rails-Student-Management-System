class Evaluation < ApplicationRecord
    belongs_to :users, class_name: "User", foreign_key: "instructor_id", optional: false
    belongs_to :users, class_name: "User", foreign_key: "grader_id", optional: false
    belongs_to :courses, class_name: "Course", foreign_key: "course_id", optional: false

    validates :instructor_id, presence: true
    validates :grader_id, presence: true
    validates :course_id, presence: true
    validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
