require 'spec_helper'

describe 'question index' do

  context 'with question' do
    before do
       Question.create(description: 'Blah blah blah blah blah blah blah', correct_answer: false)
       Question.create(description: 'Murrrr', correct_answer: true)
       visit '/questions'
    end

    it 'should display the correct answer and descriptions of the questions' do
      visit '/questions'

      expect(page).to have_content 'Blah blah'
      expect(page).to have_content 'Murrrr'
    end

    it 'has individual pages for each question' do
      visit '/questions'
      page.all('a')[4].click
      #click_link "Question #1"
      expect(page).to have_content 'Murrrr'
    end

  end

  context 'without questions' do

    it 'should display a message' do
      visit '/questions'
      expect(page).to have_content 'No Questions yet!'
    end

  end

end