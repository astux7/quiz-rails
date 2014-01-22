class AnswersController < ApplicationController
		before_action :authenticate_user!
	def new
		@question = Question.find params[:question_id]
		@answer = Answer.new(question: @question)
	end

	def create
		#redirect_to '/attempts/index' if (params[:answer].answer).nil?
		@question = Question.find params[:question_id]
		@answer = Answer.new(params[:answer].permit(:answer))
		@answer.question = @question
		@answer.user = current_user

		if @answer.save
			redirect_to '/attempts/new'
		else
			redirect_to '/questions'
		end

	end
end
