require 'spec_helper'

describe 'creating question' do
    

  context 'quiz starts no questions' do
     before do
       login
     end

    it 'should redirect to questions if not questions' do
      visit '/'
      expect(current_path).to eq '/questions'
      #raise page.html
      expect(page).to have_content 'You answered all the questions or no questions in quiz!'
    end

  end

 context 'quiz starts with questions' do
   before do
       create(:user, email:"kuku@kk.lt")
       create(:question, user_id: User.last.id)
       login
     end

    it 'should see the first random question other user' do
      visit '/'
      #raise page.html
      expect(page).to have_content 'Blah '
    end

    it 'should see get to questions if no more questions and increase save the answer' do
      visit '/'
      #raise page.html
      click_button 'Next Question'
      expect(current_path).to  eq '/questions'
      expect(Answer.count).to eq(1)
    end

  end


end