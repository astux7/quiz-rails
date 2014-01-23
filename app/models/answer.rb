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
end
