class CoursesController < ApplicationController
  before_action :authenticate_admin

  def authenticate_admin
      if (current_user.role!='Admin') || (current_user.is_approved!=true) then
          redirect_to :root
      end
  end

    def new
        @course = Course.new
    end
    
    def edit 
        @course = Course.find(params[:id])
    end

    def update
        @course = Course.find(params[:id])
        if @course.update(course_params)
          redirect_to course_view_path
        else
          render :edit
        end
    end

    def destroy
        @course = Course.find(params[:id])
        @course.destroy
        redirect_to course_view_path
    end

    def create
        @course = Course.new(course_params)
    
        if @course.save
          redirect_to course_view_path
        else
          render :new
        end
    end

    private 

    def course_params
        params.require(:course).permit(:name, :class_number, :description, :credit_hours)
    end
end
