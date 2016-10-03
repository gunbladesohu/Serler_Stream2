module LoginMacros
  def set_user_session(user)
    session[:user_id] = user.id
  end

  def sign_in(user)
    visit root_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    find('input[name="commit"]').click
  end
end
