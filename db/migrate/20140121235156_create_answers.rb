class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.boolean :answer
      t.belongs_to :user, index: true
      t.belongs_to :question, index: true

      t.timestamps
    end
  end
end
