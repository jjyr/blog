module SessionsHelper
  def current_user= user
    @current_user = user
  end

  def sign_in user
    session[:current_user] = user
    self.current_user = user
  end

  def current_user
    @current_user ||= session[:current_user]
  end

  def admin?
    session.has_key? :current_user
  end

  def logout
    session.delete :current_user
  end


  private
    def check_role
      unless admin?
        redirect_to root_path
      end
    end
end
