require 'spec_helper'

describe 'creating question' do

  context 'given a description of question' do

    it 'should display the new question on the list of questions' do
      visit '/questions/new'
      fill_in 'Question Description', with: 'Does sun shines during night time?'
      click_button 'Create Question'
      expect(current_path).to eq '/questions'
      expect(page).to have_content 'Does sun shines during night time?'
    end

  end

  context 'without a answer and description' do

    it 'should display errors' do
      visit '/questions/new'
      click_button 'Create Question'
      expect(page).to have_content 'error'
    end

  end

end