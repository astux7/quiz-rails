class AddUserIdToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :user, index: true
  end
end
