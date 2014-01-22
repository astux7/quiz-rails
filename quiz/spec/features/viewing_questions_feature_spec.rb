require 'spec_helper'

describe 'question index' do

  before(:each) do
       login
       create(:question, user_id: User.last.id)
       @question_id = create(:question, user_id: User.last.id,  description: 'Murrrr',correct_answer: true).id
  end

  context 'with question' do

    it 'has individual pages for each question' do
      visit '/questions'
      click_link @question_id
      expect(page).to have_content 'Murrrr'
    end

    it 'should display the correct answer and descriptions of the questions' do
     visit '/questions'
     expect(page).to have_content 'Blah blah'
     expect(page).to have_content 'Murrrr'
    end
  end

  context 'without questions' do

    it 'should display a message' do
      Question.destroy_all
      #raise page.html
      visit '/questions'
      expect(page).to have_content 'No Questions yet!'
    end

  end

end