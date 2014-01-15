class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new params[:question].permit(:description)

    if @question.save
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def index
    @questions = Question.all
  end
end
