class Question < ActiveRecord::Base
	belongs_to :user
	validates :description, presence: true, length: { minimum: 5 }, uniqueness: true
    has_many :answer

	def self.start_the_quiz(user)
		#random_question = Question.where('user_id <> ? AND id NOT IN (?)', user.id, Answer.select("question_id").where('user_id = ?', user.id)).order('RANDOM()').first
  		#random_question = Question.where('user_id <> ? AND id NOT IN (?)', user.id, user.answers.map(&:question_id)).order('RANDOM()').first 
  		random_question = Question.find_by_sql ['Select * from questions where questions.user_id <> ? AND questions.id NOT IN (SELECT DISTINCT question_id from answers where user_id = ?) ORDER BY RANDOM() ', user.id, user.id]
  		return random_question.first
	end
end
