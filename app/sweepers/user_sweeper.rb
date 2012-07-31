class UserSweeper < ActionController::Caching::Sweeper
  observe User

  def after_update user
    expire_fragment 'user#show'
  end
end
