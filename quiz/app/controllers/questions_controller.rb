class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new params[:question].permit(:description, :correct_answer)
    @question.user = current_user
    if @question.save
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def index
    @questions = Question.all
  end

  def edit
    @question = Question.find params[:id]
  end

  def destroy
    @question = Question.find params[:id]
    @question.destroy
    redirect_to questions_path
  end

end
