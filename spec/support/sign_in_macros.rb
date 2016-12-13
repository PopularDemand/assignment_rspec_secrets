
module SignInMacros

  def sign_in(user)
    visit root_path
    click_on('Login')
    fill_in('Email', with: user.email)
    fill_in('Password', with: 'foobar')
    click_on('Log in')
  end

end
