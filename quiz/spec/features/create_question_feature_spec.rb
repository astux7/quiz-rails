require 'spec_helper'

describe 'creating question' do

  context 'given a description of question' do

    it 'should display the new question on the list of questions' do
      visit '/questions/new'
      fill_in 'Question', with: 'Does sun shines during night time?'
      click_button 'Create Question'
 
      expect(current_path).to eq '/questions'
      expect(page).to have_content 'Does sun shines during night time?'
    end

  end

end