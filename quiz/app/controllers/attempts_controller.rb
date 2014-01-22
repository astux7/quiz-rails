class AttemptsController < ApplicationController

	def index

			 #def after_sign_in_path_for(user)
	  	@random_question = Question.start_the_quiz(current_user)
	    @answer = Answer.new(question: @random_question, user: current_user)
	     '/questions' if !@random_question 
	    '/attempts/index'

	end

	def create
		@random_question = Question.find params[:question_id]
		@answer = Answer.new(params[:answer].permit(:answer))
		@answer.question = @random_question
		@answer.user = current_user

		if @answer.save
			#redirect_to restaurant_path(@restaurant)
			flash[:notice] = "was ok"
			#render 'index'
		else
			flash[:errir] = "was bad"
			
		end
		render '/attempts/index'
	end
    


end
