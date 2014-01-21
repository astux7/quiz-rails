class Question < ActiveRecord::Base
	belongs_to :user
	validates :description, presence: true, length: { minimum: 5 }, uniqueness: true

	def self.start_the_quiz(user)

		random_question = Question.where('user_id <> ?', user.id).order('RANDOM()').first
  		return random_question
	end
end
