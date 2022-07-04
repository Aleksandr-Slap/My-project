require 'rails_helper'

feature 'User can create answer', %q{
  Help for the questioner
  As an authenticated user
  I want to write an answer
} do

  given!(:question) { create(:question) }

  describe 'Authenticated user' do
    given(:user) { create(:user) }

    background do

      sign_in(user)
 
      visit question_path(question)
    end 

    scenario 'write answer' do 
      fill_in 'Body', with: 'Body answer'
      click_on 'Create answer'

      expect(page).to have_content 'Your answer successfuly created.'
      expect(page).to have_content question.title
      expect(page).to have_content 'Body answer'
    end 

    scenario 'write answer with error' do
      click_on 'Create answer'

      expect(page).to have_content "Body can't be blank"
    end 
  end

  scenario 'Unauthorized user wants to answer a question' do
    visit question_path(question)

    click_on 'Create answer'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end  
end


  
