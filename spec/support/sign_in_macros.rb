
module SignInMacros

  def sign_in(email, password)
    visit root_path
    click_on('Login')
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    click_on('Log in')
  end

end
