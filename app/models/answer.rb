class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  before_save :correct_answer
  validates :answer, inclusion: {in: [true, false], message: 'is not a valid answer!'}
 
  def correct_answer
    self.correct = (question.correct_answer == answer)
    true
  end

  def self.difficulty(hard_level = true)
    answers = (hard_level ? 'false': 'true')
    self.find_by_sql('SELECT COUNT(answers.correct) AS stats, answers.question_id FROM answers WHERE correct = '+answers+' GROUP BY question_id ORDER BY stats DESC LIMIT 1')
  end

  def self.user_correct_per(user)
    user_all_answers = Answer.user_answers(user)
    user_correct_answers = Answer.user_correct_answers(user)
    (user_correct_answers.to_i*100)/(user_all_answers.to_i)
  end

   def self.user_answers(user)
    user_all_answers = Answer.where('user_id = ? ', user[:user_id]).count
    user_all_answers.to_s === '0' ? 1 :  user_all_answers.to_s
  end

  def self.user_correct_answers(user)
    Answer.where('user_id = ? AND correct = true', user[:user_id]).order(:question_id).count.to_s
  end

end
