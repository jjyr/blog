class TagSweeper < ActionController::Caching::Sweeper
  observe Tag

  def after_commit tag
    expire_page controller: :tags,action: :show,id: tag.name
  end
end
