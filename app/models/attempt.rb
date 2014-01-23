
class Attempt
  
  def self.statistic_users
    users_quiz = []
    User.all.each{|user|
       users_quiz << {:email => user.email, :score => 0, user_id: user.id}
    }
    users_quiz.map{|user|
      alss = Answer.where('user_id = ? ', user[:user_id]).count
      alls = alss == 0 ? 1 :  alss
      corrects = Answer.where('user_id = ? AND correct = true', user[:user_id]).order(:question_id).count
      user[:score] = (corrects*100)/(alls)
   }
   users_quiz
  end

  def self.statistic_questions
    quiz = {}
    quiz[:users_all] = User.all.count
    quiz[:questions_all] = Question.all.count
    quiz[:hardest_question] = Question.hardest_question
    quiz[:easiest_question] = Question.easiest_question
    return quiz
  end

end