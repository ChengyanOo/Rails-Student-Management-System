class Course < ApplicationRecord
    has_many :sections, dependent: :destroy
    has_many :evaluations, class_name: "Evaluation", foreign_key: "course_id"
    attribute :class_number, :integer

    def self.ransackable_attributes(auth_object = nil)
        %w(name description class_number class_level)
    end

    def self.search_graders_needed
        joins(:sections).where('sections.graders_needed > 0').distinct
    end
    
end
