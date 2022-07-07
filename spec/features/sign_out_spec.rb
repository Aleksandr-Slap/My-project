require 'rails_helper'

feature 'User can sign out', %q{
  I want to exit the app to change
  my account or create a new one
} do

  given(:user) { create(:user) }

  scenario 'User sign out' do
    sign_in(user)
    click_on 'Exit'
    expect(page).to have_content 'Signed out successfully.'
  end
end