require 'spec_helper'

describe 'editing question' do

  before do
    Question.create(description: 'Blah blah blah blah blah blah blah', correct_answer: false)
    visit '/questions'
  end

  it 'can edit the text of a question' do

    click_link 'Edit'
    fill_in 'Question Description', with: 'Bannanas red?'
    click_button 'Update Question'

    expect(page).to have_content 'Bannanas red?'

  end

  it 'can delete a quesiton' do
    click_link 'Delete'
    expect(page).not_to have_content 'Bannanas red?'
  end

end