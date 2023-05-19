class EvaluationsController < ApplicationController
  before_action :set_eval, only: [:show, :destroy]

  #Used to display evaluations
  def index
    @evaluations = Evaluation.all
  end

  #Form to create an evaluation
  def new
    @evaluation = Evaluation.new
  end

  #Used to create a new evaluation
  def create
    evaluation_params[:instructor_id] = current_user.id
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      redirect_to course_view_path, notice: 'Evaluation Created.'
    else
        render(:new, status: :unprocessable_entity, notice: "Error. Try Agian!!")
    end
  end

  #Used to destory an evaluation
  def destroy
    @evaluation.destroy
    redirect_to evaluations_path
  end

  def particular_eval
    @evaluation = Evaluation.find(params[:id])
  end

  private
  def evaluation_params
    params.require(:evaluation).permit(:instructor_id, :grader_id, :rating, :comments, :course_id)
  end
end