class StudentApplicationsController < ApplicationController
    def new
        @section = Section.find(params[:section_id])
        @student_application = StudentApplication.new(section_id: params[:section_id])
    end

    def create
        @student_application = StudentApplication.new(student_application_params)
        @student_application.user_id = current_user.id
        
        
        # Try to find an existing CourseTaken record for the current user and course
        @course_taken = CourseTaken.find_or_initialize_by(
        user_id: @student_application.user_id,
        course: "CSE" + @student_application.section.course.class_number.to_s
        )

        # Update the grade_received attribute of the existing or new CourseTaken record
        @course_taken.grade_received = @student_application.temp_grade_received


        if @student_application.save && @course_taken.save
            # Handle successful save
            redirect_to course_view_path
        else
            # Handle failed save
            render :new
        end
    end

    def edit
        @section = Section.find(params[:section_id])
        @student_application = StudentApplication.find(params[:id])
        @course_taken = CourseTaken.where(user_id: current_user.id, course: "CSE" + @student_application.section.course.class_number.to_s).first
        @temp_grade_received = @course_taken.grade_received
    end

    def update
        @student_application = StudentApplication.find(params[:id])
        @section = Section.where(section_id: @student_application.section_id)
        @course_taken = CourseTaken.where(user_id: current_user.id, course: "CSE" + @student_application.section.course.class_number.to_s).first
        if @student_application.update(student_application_params) && @course_taken.update(grade_received: @student_application.temp_grade_received)
          redirect_to course_view_path
        else
          render :edit
        end
    end

    private
  
    def student_application_params
        params.require(:student_application).permit(:temp_grade_received, :section_id, :date, :student_available, :student_preference)
    end
end