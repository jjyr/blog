class SessionsController < ApplicationController

  before_filter :check_login,only: [:new,:create]
  before_filter :check_role,only: :destroy

  def new
  end

  def create
    @user = User.find_by_email params[:session][:email]
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      flash["success"] = "login success"
      redirect_to root_path
    else
      flash.now["error"] = "email/password invalid!"
      render :new
    end
  end

  def destroy
    logout
    flash["info"] = "logout"
    redirect_to root_path
  end

  private
    def check_login
      if admin?
        flash["info"] = "You having be login"
        redirect_to root_path
      end
    end
end
