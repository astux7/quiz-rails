require 'spec_helper'

describe 'creating question' do
     before(:each) do
       visit '/users/sign_up'
       fill_in 'Email', with: 'asta3p@ra.com'
       fill_in 'Password', with: '12345678'
       fill_in 'Password confirmation', with: '12345678'
       click_button 'Sign up'
     end

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