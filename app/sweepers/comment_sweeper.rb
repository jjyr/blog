class CommentSweeper < ActionController::Caching::Sweeper
  observe Comment

  def after_create comment
    expire_comments comment
    expire_fragment "detail"
  end

  def after_update comment
    expire_comments comment
  end

  def after_destroy comment
    expire_comments comment
    expire_fragment "detail"
  end

  private
  def expire_comments comment
    expire_fragment "posts#show#comments#{comment.post_id}#{true}"
    expire_fragment "posts#show#comments#{comment.post_id}#{false}"
  end
end
