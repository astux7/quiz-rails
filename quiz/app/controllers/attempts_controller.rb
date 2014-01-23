class AttemptsController < ApplicationController

    def show
		redirect_to new_attempt_path
    end

	def new
	  	@random_question = Question.start_the_quiz(current_user)
	    @answer = Answer.new(question: @random_question, user: current_user)

	    unless @random_question
	      	flash[:error] = "You answered all the questions or no questions in quiz!"
	      	redirect_to  questions_path
	    end
	end

	def index
       @quiz = {}
	   @users_quiz = []
	   
	   @quiz[:users_all] = User.all.count
	   @quiz[:questions_all] = Question.all.count
	   hard = Answer.difficulty
	   easy = Answer.difficulty(false)
	  # raise hard.inject

       if hard.empty? && easy.empty?
       	 h_score = "None"
       	 e_score = "None"
       else 
		   hard_desc = Question.select('description').where('id = ?',hard[0].question_id)
		   h_score = hard_desc[0]['description'].to_s
		   easy_desc = Question.select('description').where('id = ?',easy[0].question_id)
		   e_score = easy_desc[0]['description'].to_s
	   end
	   @quiz[:hardest_question] = h_score
	   @quiz[:easiest_question] = e_score

	   User.all.each{|user|
	   	    @users_quiz << {:email => user.email, :score => 0, user_id: user.id}
	   }
	   @users_quiz.map{|user|
           alss = Answer.where('user_id = ? ', user[:user_id]).count
	       alls = alss == 0 ? 1 :  alss
	       corrects = Answer.where('user_id = ? AND correct = true', user[:user_id]).order(:question_id).count
	   	   user[:score] = (corrects*100)/(alls)
	    }

	   render 'index'
	end	
end
