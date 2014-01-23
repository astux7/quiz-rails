require 'spec_helper'
#sql output during test
#ActiveRecord::Base.logger = Logger.new(STDOUT)

describe Answer do

  let(:nw) {create(:user, email:"kuku@kk.lt")}
  let!(:nq){create(:question, user_id: nw.id)}
  let!(:nq2){create(:question, description: 'Murrr', user_id: nw.id)}
  let!(:na) {create(:user, email:"ku@kk.lt")}
  let!(:nu) {create(:user)}

  describe 'to test Answer saving and correct column update' do 
    it 'should set correct to true in answer if quessed correct' do
      a = create(:answer, user_id: nu.id, question_id: nq.id)
      expect(a.correct).to be_true
    end

     it 'should set correct to false in answer if quessed incorrect' do
      a = create(:answer, answer: true, user_id: nu.id, question_id: nq.id)
      expect(a.correct).to be_false
    end
  end

 describe 'to testing for Answer difficulty' do 
   it 'should choose most harder answers having question id' do
      a = create(:answer, answer: true, user_id: nu.id, question_id: nq.id)
      a = create(:answer, answer: true, user_id: na.id, question_id: nq.id)
      a = create(:answer, user_id: na.id, question_id: nq2.id)
      q = Answer.difficulty
      expect(q[0].question_id).to eq(nq.id)
    end
    it 'should choose most easy answers having question id' do
      a = create(:answer, answer: true, user_id: nu.id, question_id: nq.id)
      a = create(:answer, answer: true, user_id: na.id, question_id: nq.id)
      a = create(:answer, user_id: na.id, question_id: nq2.id)
      q = Answer.difficulty(false)
      expect(q[0].question_id).to eq(nq2.id)
    end

  end

end
