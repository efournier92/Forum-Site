class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question Created!'
      redirect_to question_path(@question)
    else
      render new_question_path
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    if @question.save
      flash[:notice] = 'Question Saved!'
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    Answer.where(question_id: params[:id]).destroy_all
    unless @question
      flash[:notice] = 'Question Deleted!'
      redirect_to '/'
    else
      render 'show'
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end

end
