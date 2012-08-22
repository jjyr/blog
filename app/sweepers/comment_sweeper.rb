class CommentSweeper < ActionController::Caching::Sweeper
  observe Comment

  def after_create comment
    expire_comments comment
    expire_fragment "detail"
    expire_posts_index
  end

  def after_update comment
    expire_comments comment
  end

  def after_destroy comment
    expire_comments comment
    expire_fragment "detail"
    expire_posts_index
  end

  private
  def expire_comments comment
    expire_fragment "posts#show#comments#{comment.post_id}#{true}"
    expire_fragment "posts#show#comments#{comment.post_id}#{false}"
  end

  def expire_posts_index
    expire_fragment "posts#index#{true}"
    expire_fragment "posts#index#{false}"
  end
end
