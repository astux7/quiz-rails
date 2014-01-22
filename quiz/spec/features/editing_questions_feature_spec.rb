require 'spec_helper'

describe 'editing question' do

  before(:each) do
       visit '/users/sign_up'
       fill_in 'Email', with: 'asta3p@ra.com'
       fill_in 'Password', with: '12345678'
       fill_in 'Password confirmation', with: '12345678'
       click_button 'Sign up'
       Question.create!(description: 'Blah blah blah blah blah blah blah', correct_answer: false, user_id: User.last.id)
       
  end

  it 'can edit the text of a question' do
   # raise page.html
    visit '/questions'
    click_link 'Edit'
    fill_in 'Question Description', with: 'Bannanas red?'
    click_button 'Update Question'

    expect(page).to have_content 'Bannanas red?'

  end

  it 'can delete a quesiton' do
    visit '/questions'
    click_link 'Delete'
    expect(page).not_to have_content 'Bannanas red?'
  end

end