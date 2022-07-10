require 'rails_helper'

feature 'User can delete his question', %q{
  If user is the author of
  question, he can delete it
} do

  given(:user) { create(:user) }
  let!(:question) {create(:question, user: user)}

  scenario 'User deletes his question' do
    sign_in(user)

    visit question_path(question)

    save_and_open_page

    click_on 'Delete'
    expect(page).to have_content 'Question successfully deleted.'
    expect(page).to have_content 'All questions'
  end
end