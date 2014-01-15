class QuestionsController < ApplicationController
  def new
    @question = Questions.new
  end

  def create
    @question = Questions.new params[:questions].permit(:description)

    if @question.save
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def index
    @questions = Questions.all
  end
end
