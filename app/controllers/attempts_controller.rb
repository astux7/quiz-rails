class AttemptsController < ApplicationController

    def show
			redirect_to new_attempt_path
    end

	def new
	  	@random_question = Question.start_the_quiz(current_user)
	    @answer = Answer.new(question: @random_question, user: current_user)

	    unless @random_question
	  		set_flash_msg
	    	redirect_to questions_path
	    end
	end

	def index
     @quiz = Attempt.statistic_questions
	   @users_quiz = Attempt.statistic_users
	   render 'index'
	end	

	protected

		def set_flash_msg
			flash[:success] = flash[:success]
		  flash[:error] = flash[:error]
		  flash[:notice] = " You answered all the questions or no questions in quiz!"
		end
end
