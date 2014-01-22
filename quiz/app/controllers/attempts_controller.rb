class AttemptsController < ApplicationController

    def show
		redirect_to '/attempts/new'
    end

	def new
	  	@random_question = Question.start_the_quiz(current_user)
	    @answer = Answer.new(question: @random_question, user: current_user)

	    unless @random_question
	      	flash[:notice] = "You answered all the questions!"
	      	redirect_to  '/questions' 
	    end
	end
end
