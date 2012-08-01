class PostSweeper < ActionController::Caching::Sweeper
  observe Post

  def after_create post
    expire_post_index
    expire_tags
    expire_fragment "detail"
  end

  def after_update post
    expire_post_index
    expire_post_show post
    expire_tags
    expire_fragment "detail"
  end

  def after_destroy post
    expire_post_index
    expire_post_show post
    expire_fragment "posts#show#comments#{post.id}true"
    expire_fragment "posts#show#comments#{post.id}false"
    expire_tags
    expire_fragment "detail"
  end

  private
  def expire_tags
    expire_fragment 'tags#top'
    expire_fragment 'tags#index'
  end

  def expire_post_index
    expire_fragment "posts#indexfalse"
    expire_fragment "posts#indextrue"
  end

  def expire_post_show post
    expire_fragment "posts#show#{post.id}true"
    expire_fragment "posts#show#{post.id}false"
  end
end
