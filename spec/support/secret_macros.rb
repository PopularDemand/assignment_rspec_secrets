
module SecretMacros
  def create_secret(title, body)
    visit new_secret_path
    fill_in_secret_form(title, body)
    click_on('Create Secret')
  end

  def fill_in_secret_form(title, body)
    fill_in('secret_title', with: title)
    fill_in('secret_body', with: body)
  end
end
