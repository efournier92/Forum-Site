class AnswersController < ApplicationController

  def new
    @answer   = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer   = Answer.new(question_id: params[:question_id], description: params[:answer][:description])
    @question = Question.find(params[:question_id])
    if @answer.save
      flash[:notice] = 'Answer Submitted!'
      redirect_to question_answers_path
    else
      render 'new'
    end
  end

  def index
    @answers = Answer.where(question_id: params[:question_id])
  end

  private

  def answer_params
    params.require(:answer).permit!
  end

end
