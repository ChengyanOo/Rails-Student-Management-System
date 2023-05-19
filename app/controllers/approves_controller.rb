class ApprovesController < ApplicationController
    #Actions
    before_action :authenticate_user!
    before_action :authenticate_admin

    def approve
        @users = User.where(is_approved: false, role: [:Admin, :Instructor])
        @student_applications = []
        User.joins(student_applications:[{section: :course}]).select("users.*, student_applications.id AS sa_id, student_applications.section_id, courses.*, sections.*").each do |record|
            @student_applications << record.attributes.merge(number_of_recommendations: fetch_recommendations(record.sa_id).length)
            @student_applications << record.attributes.merge(fetch_grades: fetch_grade(record.sa_id))
        end
    end
end