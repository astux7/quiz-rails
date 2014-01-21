class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #added auth for login
  before_action :authenticate_user!

  def after_sign_in_path_for(user)
  	random_question = Question.start_the_quiz(user)
    question_path(random_question)
  end
  # def index
  #    @questions =  questions_controller.classify
  # end
end
