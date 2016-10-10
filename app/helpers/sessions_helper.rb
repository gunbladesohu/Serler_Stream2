module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end
# Returns the current logged-in user (if any).
  def current_user
     @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns the current logged-in user role.
  def current_user_role
     @current_user_role ||= User.joins("LEFT JOIN users_roles on users.id = users_roles.user_id LEFT JOIN roles on users_roles.role_id = roles.id")
    .select("roles.name ")
    .where("users_roles.is_active = true and roles.is_active = true and users.id=#{session[:user_id]}").first

  end

  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
    @current_user_role = nil
  end

end
