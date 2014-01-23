class Question < ActiveRecord::Base
	belongs_to :user
  has_many :answer
  validates :description, presence: true, length: { minimum: 5 }, uniqueness: true
	
	def self.start_the_quiz(user)
		random_question = Question.find_by_sql ['Select * from questions where questions.user_id <> ? AND questions.id NOT IN (SELECT DISTINCT question_id from answers where user_id = ?) ORDER BY RANDOM() ', user.id, user.id]
  	return random_question.first
	end

  def self.hardest_question
    hard = Answer.difficulty
    return 'None' if hard.empty?
    hard_desc = Question.select('description').where('id = ?',hard[0].question_id)
    h_score = hard_desc[0]['description'].to_s
    return h_score
  end

  def self.easiest_question
    easy = Answer.difficulty(false)
    return 'None' if easy.empty?
    easy_desc = Question.select('description').where('id = ?',easy[0].question_id)
    e_score = easy_desc[0]['description'].to_s
    return e_score
  end
end
