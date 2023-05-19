class SectionsController < ApplicationController
  before_action :authenticate_admin

    def authenticate_admin
        if (current_user.role!='Admin') || (current_user.is_approved!=true) then
            redirect_to :root
        end
    end


    def edit
        @section = Section.find(params[:id])
    end

    def update
        @section = Section.find(params[:id])
        if @section.update(section_params)
          redirect_to course_view_path
        else
          render :edit
        end
    end

    def destroy
        @section = Section.find(params[:id])
        @section.destroy
        redirect_to course_view_path
    end

    def new
        @section = Section.new
        @courseid = params[:courseid]
    end

    def create
        logger.debug params.inspect

        @section = Section.new(section_params)

        puts @section
    
        if @section.save
          redirect_to course_view_path
        else
          render :new
        end
      end
      

  
  

  def edit
      @section = Section.find(params[:id])
  end

  def update
      @section = Section.find(params[:id])
      if @section.update(section_params)
        redirect_to course_view_path
      else
        render :edit
      end
  end

  def destroy
      @section = Section.find(params[:id])
      @section.destroy
      redirect_to course_view_path
  end

  def new
    @section = Section.new
    @courseid = params[:courseid]
  end

  def create
      logger.debug params.inspect

      @section = Section.new(section_params)

      puts @section
  
      if @section.save
        redirect_to course_view_path
      else
        render :new
      end
  end


  private 

  def section_params
      params.require(:section).permit(:start_time, :end_time, :num_of_days, :campus, :term, :instructionMode, :graders_needed, :is_lab, :course_id, :monday, :tuesday, :wednesday, :thursday, :friday)
  end
end