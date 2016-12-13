require 'rails_helper'

feature 'User secret creation' do
  let(:user) { create(:user) }

  it 'allows user to create secret' do
    sign_in(user)
    create_secret
    expect(page).to have_content('Secret was successfully created')
  end

  it 'allows user to edit secret' do
    sign_in(user)
    create_secret
    click_on('Edit')
    fill_in_secret_form('New title', 'new body')
    click_on('Update Secret')
    expect(page).to have_content('Secret was successfully updated')
  end
end