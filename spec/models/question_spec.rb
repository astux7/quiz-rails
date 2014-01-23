require 'spec_helper'
#sql output during test
#ActiveRecord::Base.logger = Logger.new(STDOUT)

describe Question do
  let(:nw) {create(:user, email:"kuku@kk.lt")}
  let!(:nq){create(:question, user_id: nw.id)}
  let!(:nq2){create(:question, description: 'Murrr', user_id: nw.id)}
  let!(:na) {create(:user, email:"ku@kk.lt")}
  let!(:nu) {create(:user)}
  
  describe 'testing the start_the_quiz' do
  	it 'should generate random question for not same user' do

  		expect([nq,nq2]).to include(Question.start_the_quiz(nu))
  	end
  end

  describe 'testing the statistic about questions' do
    it 'should return the hardest q description' do
      create(:answer, answer: true, user_id: nu.id, question_id: nq.id)
      create(:answer, answer: true, user_id: na.id, question_id: nq.id)
      create(:answer, user_id: na.id, question_id: nq2.id)
      qq = Question.hardest_question
      expect(qq).to eq(nq.description)
    end
    it 'should return the easiest q description' do
      create(:answer, answer: false, user_id: nu.id, question_id: nq.id)
      create(:answer, answer: false, user_id: na.id, question_id: nq.id)
      create(:answer, user_id: na.id, question_id: nq2.id)
      qq = Question.easiest_question
      expect(qq).to eq(nq.description)
    end
  end

end
