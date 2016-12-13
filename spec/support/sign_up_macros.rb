
module SignUpMacros
  def fill_in_user_form(args)
    fill_in('user_name', with: args[:name])
    fill_in('user_email', with: args[:email])
    fill_in('user_password', with: args[:pw])
    fill_in('user_password_confirmation', with: args[:pwc])
  end
end
