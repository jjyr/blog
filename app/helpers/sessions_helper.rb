module SessionsHelper
  def current_user= user
    @current_user = user
  end

  def sign_in user,remember
    if remember
      cookies.permanent[:authentication_token] = user.authentication_token
    else
      cookies[:authentication_token] = user.authentication_token
    end
    self.current_user = user
  end

  def current_user
    @current_user ||= User.find_by_authentication_token(cookies[:authentication_token])
  end

  def admin?
    !current_user.nil?
  end

  def logout
    self.current_user = nil
    cookies.delete :authentication_token
  end


  private
    def check_role
      unless admin?
        redirect_to root_path
      end
    end
end
