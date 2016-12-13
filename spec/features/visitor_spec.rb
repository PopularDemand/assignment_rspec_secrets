require 'rails_helper'

feature 'Visitor secrets' do

  it 'allows visitors to see secrets' do
    visit root_path
    expect(page).to have_content('Listing secrets')
  end

end

feature 'Visitor sign up' do
  context 'visitor provides valid data' do
    it 'allows visitors to sign up' do
      visit new_user_path
      fill_in_user_form(name: 'Alexa', email: 'seekrit',
                        pw: 'password', pwc: 'password')
      click_on('Create User')
      user = User.where(email: 'seekrit')[0]
      expect(current_path).to eq(user_path(user))
    end
  end

  context 'visitor provides invalid data' do
    it 'disallows visitor to sign up' do
      visit new_user_path
      fill_in_user_form(name: '', email: '',
                        pw: '', pwc: '')
      click_on('Create User')
      expect(page).to have_content('4 errors')
    end
  end
end

feature 'Visitor sign in' do
  context 'visitor provides valid data' do
    it 'allows registered users to sign in' do
      user = create(:user, password: 'foobar')
      sign_in(user.email, 'foobar')
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome, #{user.name}")
    end
  end

  context 'visitor provides invalid data' do
    it 'disallows registered users to sign in' do
      user = create(:user, password: 'foobar')
      sign_in(user.email, 'wrongpassword')
      expect(page).to_not have_content("Welcome, #{user.name}")
    end
  end
end

feature 'Visitor authorization' do
  it 'disallows creation of secrets' do
    visit new_secret_path
    expect(current_path).to eq(new_session_path)
  end  
end