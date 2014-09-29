class AnswersController < ApplicationController
	before_action :authenticate_user!

	def create
		@question = Question.find params[:question_id]
		@answer = Answer.new(params[:answer].permit(:answer))
		@answer.question_id = @question.id
		@answer.user = current_user
    if @answer.save!
     	@answer.correct ? flash[:success] = "Correct Answer!" : flash[:error] = "Incorrect Answer!"
			redirect_to  new_attempt_path
		else
			redirect_to questions_path
		end
	end
end
