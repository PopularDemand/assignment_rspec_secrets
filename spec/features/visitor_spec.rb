require 'rails_helper'

feature 'Visitor secrets' do

  it 'allows visitors to see secrets' do
    visit root_path
    expect(page).to have_content('Listing secrets')
  end

end

feature 'Visitor sign up' do
  it 'allows visitors to sign up' do
    visit new_user_path
    fill_in('user_name', with: 'Alexa')
    fill_in('user_email', with: 'seekrit')
    fill_in('user_password', with: 'top100password')
    fill_in('user_password_confirmation', with: 'top100password')
    click_on('Create User')
    user = User.first
    expect(current_path).to eq(user_path(user))
  end
end

feature 'Visitor sign in' do
  it 'allows registered users to sign in' do
    user = create(:user)
    sign_in(user)
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, #{user.name}")
  end
end
