class AddAnswerToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :correct_answer, :boolean
  end
end
