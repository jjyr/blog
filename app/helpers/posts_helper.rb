module PostsHelper
  TAGS_REGEX = /[\s,]+/

  def show_tags post
    if tags = post.tags
      tags.map(&:name).join ", "
    end
  end

  def split_tags tags
    tags.split TAGS_REGEX
  end


  def update_tags post,tags
    tags = split_tags(tags).map do |tag|
      post.tags.build name: tag
    end
    @post.tags = tags
    @post.save
  end

  alias add_tags update_tags
end
