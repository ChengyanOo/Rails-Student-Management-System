class SectionInstructor < ApplicationRecord
  belongs_to :instructor, class_name: 'User', optional: true
  belongs_to :teaching_assistant, class_name: 'User', optional: true
  belongs_to :section, class_name: 'Section', optional: true
end
