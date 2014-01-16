require 'spec_helper'

describe 'editing question' do

  before do
    Question.create(description: 'Blah blah blah blah blah blah blah', correct_answer: false)
    visit '/questions'
  end

  it 'can edit the text of a question' do

    click_link 'Edit this question'
    fill_in 'Question Description', with: 'Bannanas red?'
    click_button 'Save the question!'

    expect(page).to have_content 'Bannanas red?'

  end

  it 'can delete a quesiton' do
    click_link 'Delete this question'
    expect(page).not_to have_content 'Bannanas red?'
  end

end