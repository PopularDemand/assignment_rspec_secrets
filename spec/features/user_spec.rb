require 'rails_helper'

feature 'User secret creation' do
  let(:user) { create(:user) }

  context 'user provides valid data' do
    it 'allows user to create secret' do
      sign_in(user.email, 'foobar')
      create_secret('title', 'body')
      expect(page).to have_content('Secret was successfully created')
    end

    it 'allows user to edit secret' do
      sign_in(user.email, 'foobar')
      create_secret('title', 'body')
      click_on('Edit')
      fill_in_secret_form('New title', 'new body')
      click_on('Update Secret')
      expect(page).to have_content('Secret was successfully updated')
    end

    it 'allows user to delete their secret' do
      sign_in(user.email, 'foobar')
      create_secret('Delete me title', 'body')
      visit root_path
      expect{ click_on 'Destroy' }.to change(Secret, :count).by(-1)
    end
  end

  context 'user provides invalid data' do
    it 'disallows user to create secret' do
      sign_in(user.email, 'foobar')
      create_secret('', '')
      expect(page).to have_content('4 errors')
    end

    it 'allows user to edit secret' do
      sign_in(user.email, 'foobar')
      create_secret('title', 'body')
      click_on('Edit')
      fill_in_secret_form('', '')
      click_on('Update Secret')
      expect(page).to have_content('4 errors')
    end
  end

end
