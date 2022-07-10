require 'rails_helper'

feature 'User can view question and its answers' do

  given(:question) { create(:question) }
  given!(:answers) {create_list(:answer, 3, question: question)}
  
  scenario 'User sees question and list answers' do
    visit question_path(question)
    
    expect(page).to have_content question.title
    expect(page).to have_content question.body
    answers.each { |a| expect(page).to have_content a.body }
  end
end