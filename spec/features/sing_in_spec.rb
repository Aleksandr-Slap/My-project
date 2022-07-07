require 'rails_helper'

feature 'User can sing in', %q{
  In order to ask questions
  As an unauthenticated user
  I'd like to be able to sign in
} do

  given(:user) { create(:user) }
 
  background { visit new_user_session_path }

  scenario 'Registered user tries to sing in' do
    # User.create!(email: 'user@test.com', password: '12345678')            Исполузуем хелпер given, аналог (let) для создания переменных 

    # visit new_user_session_path                                           Используем хелпер background. Аналог "before" 26 строка так же 
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Enter'
    
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'Unregistered user tries to sing in' do
    # visit new_user_session_path
    fill_in 'Email', with: 'foo@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Enter'
    
    expect(page).to have_content 'Invalid Email or password.'
  end
end