class Attempt
  
  def self.statistic_users
    users_quiz = format_user_stat
    update_scores(users_quiz)
  end

  def self.statistic_questions
    quiz = {}
    quiz[:users_all] = User.all.count
    quiz[:questions_all] = Question.all.count
    quiz[:hardest_question] = Question.hardest_question
    quiz[:easiest_question] = Question.easiest_question
    return quiz
  end

  def self.format_user_stat
    users_quiz = []
    User.all.each{|user|
       users_quiz << {:email => user.email, :score => 0, user_id: user.id}
    }
    users_quiz
  end

  def self.update_scores(users_quiz)
    users_quiz.map{|user|
      user[:score] = Answer.user_correct_per(user).to_i
    }
    users_quiz
  end

end