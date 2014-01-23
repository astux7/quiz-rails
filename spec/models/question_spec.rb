require 'spec_helper'
#sql output during test
#ActiveRecord::Base.logger = Logger.new(STDOUT)

describe Question do
	let(:nw) {create(:user, email:"kuku@kk.lt")}
	let!(:nq) {create(:question, user_id: nw.id)}
	let(:nu) {create(:user)}
  
	it 'should generate random question for not same user' do
		expect(Question.start_the_quiz(nu)).to eq(nq)
	end

end
