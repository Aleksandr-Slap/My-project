require 'rails_helper'

feature 'User can view list of questions', %q{
  To solve their problem, the user wants to
  see a list of questions
} do

  given!(:questions) {create_list(:question, 3)}

  scenario 'User sees list of questions' do
    visit questions_path
    questions.each { |q| expect(page).to have_content q.title }
  end
end