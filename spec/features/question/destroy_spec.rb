require 'rails_helper'

feature 'User can delete his question', %q{
  If user is the author of
  question, he can delete it
} do

  scenario 'User deletes his question' do
    user = create(:user)
    sign_in(user)

    click_on 'Ask question'

    fill_in 'Title', with: 'Test question'
    fill_in 'Body', with: 'text text text'
    click_on 'Ask'

    expect(page).to have_content 'Your question successfuly created.'
    expect(page).to have_content 'Test question'
    expect(page).to have_content 'text text text'
    
    click_on 'Delete'
    expect(page).to have_content 'Question successfully deleted.'
    expect(page).to have_content 'All questions'
  end
end