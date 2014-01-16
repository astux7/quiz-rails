class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #added auth for login
  before_action :authenticate_user!

  # def index
  #    @questions =  questions_controller.classify
  # end
end
