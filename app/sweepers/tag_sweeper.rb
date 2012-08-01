class TagSweeper < ActionController::Caching::Sweeper
  observe Tag

  def after_commit tag
    expire_fragment "tags#show#{tag.name}"
  end
end
