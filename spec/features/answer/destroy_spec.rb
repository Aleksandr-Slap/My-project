require 'rails_helper'

feature 'User can delete his answer', %q{
  If user is the author of
  answer, he can delete it
} do
  
  given(:user) { create(:user) }
  let(:question) { create(:question, user: user)}
  let!(:answer) { create(:answer, question: question, user: user)}
  
  scenario 'User deletes his answer' do

    sign_in(user)

    visit question_path(question) 
    click_on 'Delete answer'

    expect(page).to have_content 'Answer successfully deleted.'
    expect(page).to have_content question.body
    expect(page).to have_content question.title 
  end
end