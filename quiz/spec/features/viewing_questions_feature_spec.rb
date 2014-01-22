require 'spec_helper'

describe 'question index' do

  context 'with question' do

    before(:each) do
    
    

       visit '/users/sign_up'
       fill_in 'Email', with: 'asta3p@ra.com'
       fill_in 'Password', with: '12345678'
       fill_in 'Password confirmation', with: '12345678'
       click_button 'Sign up'
       visit '/questions'
       Question.create(description: 'Blah blah blah blah blah blah blah', correct_answer: false, user_id:User.last.id)
       @d = Question.create!(description: 'Murrrr', correct_answer: true, user_id:User.last.id)
       # page.driver.delete('/users/sign_out')
       # visit '/users/sign_up'
       # fill_in 'Email', with: 'as33p@ra.com'
       # fill_in 'Password', with: '12345678'
       # fill_in 'Password confirmation', with: '12345678'
       # click_button 'Sign up'
       # visit '/questions'
    end

    it 'has individual pages for each question' do
      visit '/questions'
      click_link @d.id
      expect(page).to have_content 'Murrrr'
    end

    it 'should display the correct answer and descriptions of the questions' do
     visit '/questions'
   # expect(1).to eq(1)
     expect(page).to have_content 'Blah blah'
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