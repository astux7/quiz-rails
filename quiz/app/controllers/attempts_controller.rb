class AttemptsController < ApplicationController

	def index
		redirect_to '/attempts/new'
	end

    def show
		redirect_to '/attempts/new'
    end

	def new

			 #def after_sign_in_path_for(user)
	  	@random_question = Question.start_the_quiz(current_user)
	    @answer = Answer.new(question: @random_question, user: current_user)
	     redirect_to '/questions' if !@random_question 
	    render 'new'

	end

	


end
