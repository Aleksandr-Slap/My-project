require 'rails_helper'

feature 'User can create question', %q{
  In order to get answer from community
  As an authenticated user
  I'd like de able to ask the question
} do 

  given(:user) { create(:user) }

  describe 'Authenticated user' do                     # Вынесли два сценария в отдельную группу, чтобы "sign_in(user)" не мешал сценарию 3

    background do                                      # Используем background. Аналог "before". Заключаем в него код, повторяющийся в разных сценариях

      sign_in(user)                                    # Вынесли код из "background" отвечающий за авторизацию в модуль(feature_helpers),
                                                       # тк будем использовать авторизацию в других feature тестах(не будем дублировать код, он будет написан один раз)
      # visit new_user_session_path                     
      # fill_in 'Email', with: user.email
      # fill_in 'Password', with: user.password        # Оставил для памятки по работе background & sign_in(user)
      # click_on 'Log in'

      visit questions_path                             # Перейти по указанному маршруту
      click_on 'Ask question'                          # И нажать кнопку
    end  


    scenario 'asks a question' do 
      fill_in 'Title', with: 'Test question'                             # Выбрать поле и данные
      fill_in 'Body', with: 'text text text'                            
      click_on 'Ask'                                                     # Нажать кнопку (название)

      expect(page).to have_content 'Your question successfuly created.'  # Требуем подтвердить наличие текста на странице
      expect(page).to have_content 'Test question'
      expect(page).to have_content 'text text text'
    end
      
    scenario 'asks a question with errors' do
      click_on 'Ask'

      expect(page).to have_content "Title can't be blank"
    end
  end  

  scenario 'Unauthenticated user tries to ask a question' do
    visit questions_path
    click_on 'Ask question'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end