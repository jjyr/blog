module PostsHelper
  TAGS_REGEX = /[\s+,]/

  def show_tags post
    if tags = post.tags
      tags.map(&:name).join ", "
    end
  end

  def split_tags tags
    tags.split TAGS_REGEX
  end

  def add_tags post,tags
    split_tags(tags).each do |tag|
      post.tags.create name: tag
    end
  end

  def update_tags post,tags
    tags = split_tags(tags).map do |tag|
      post.tags.build name: tag
    end
    old_tags = @post.tags.all
    (old_tags - tags).each &:destroy
    (tags - old_tags).each &:save
  end
end
