class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :update_allowed_parameters, if: :devise_controller?

    protected

    def update_allowed_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :role, :is_approved, :password_confirmation)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password, :password_confirmation)}
    end

    def authenticate_admin
        redirect_to root_path && return unless current_user.role == 'Admin' || !current_user.is_approved
     end

    def fetch_recommendations(student_application_id)
        recommendations = InstructorRecommendation.joins(
          "INNER JOIN student_applications sa ON instructor_recommendations.student_id = sa.user_id AND instructor_recommendations.section_id = sa.section_id"
        ).where("sa.id = ?", student_application_id)
        # inspect each recommendation
        recommendations.each do |recommendation|
            puts "recommendation: #{recommendation.inspect}"
        end
        recommendations
    end

    def fetch_grade(student_application_id)
        courseNames = StudentApplication.joins(
          "INNER JOIN student_applications sa ON sections.id = sa.section_id AND sa.course_id = courses.id"
        ).where("sa.id = ?", student_application_id)

        courseGrades = StudentApplication.joins(
            "INNER JOIN student_applications sa ON course_takens.user_id = sa.user_id"
        ).where("sa.id = ?", student_application_id)
        
        specificCourseGrades = courseNames.join("INNER JOIN courseNames c ON c.name = courseGrades.name")
        
        # inspect each recommendation
        specificCourseGrades.each do |specificCourseGrade|
            puts "specificCourseGrade: #{specificCourseGrade.inspect}"
        end
        specificCourseGrades
    end
end
