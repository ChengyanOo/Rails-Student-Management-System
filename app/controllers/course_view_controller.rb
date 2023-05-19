class CourseViewController < ApplicationController
  include Pagy::Backend
  def index
    @pagy, @courses = pagy(Course.all, items: 10)
    @pagy, @courses = pagy(Course.all, items: 10)

    @q = Course.ransack(params[:q])
  end

  def search
    @q = Course.ransack(params[:q])
    #@q.class_number_eq = params[:q][:class_number_eq] if params[:q] && params[:q][:class_number_eq]
    @courses = @q.result(distinct: true)
    @pagy, @courses = pagy(@courses, items: 10)
  end

  def tag
    @q = Course.ransack(params[:q])
    @tag = params[:tag]
    @courses = Course.where("class_level LIKE ?", "#{@tag}%")
    @pagy, @courses = pagy(@courses, items: 10)
    render 'search'
  end

  def graders_needed
    puts "Graders needed called"
    @q = Course.search_graders_needed.ransack(params[:q])
    @courses = @q.result(distinct: true)
    @pagy, @courses = pagy(@courses, items: 10)
    render 'search'
  end
end
