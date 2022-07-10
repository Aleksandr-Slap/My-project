require 'rails_helper'

feature 'User can sign up', %q{
  To enter the system, the user
  can register.
} do

  background do 
    visit questions_path
    click_on 'Sing in'
  end 

  scenario 'User enters the valid data' do
    fill_in 'Email', with: 'pavel@mail.ru'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(page).to have_content 'All questions'
  end

  scenario 'User enters the invalid data' do
    click_on 'Sign up'
    expect(page).to have_content '2 errors prohibited this user from being saved'
  end
end