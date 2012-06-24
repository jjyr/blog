class Tag < ActiveRecord::Base
  belongs_to :post
  attr_accessible :name

  validates :name,presence: true
  validates :name,length: 1..10

  def self.tags
    select("distinct name,count(tags.name)").order("count(tags.name) DESC").group "tags.name"
  end

  def self.find_tags_by_name name
    where "name = ?",name
  end

  def self.top n
    tags.take n
  end

  def tag_count
    Tag.find_tags_by_name(name).count
  end

  def self.add_tags post,tags
    split_tags(tags).each do |tag|
      post.tags.create name: tag
    end
  end

  def self.update_tags post,tags
    tags = split_tags(tags).map do |tag|
      post.tags.build name: tag
    end
    old_tags = @post.tags.all
    (old_tags - tags).each &:destroy
    (tags - old_tags).each &:save
  end

  private
    def self.split_tags tags
      tags.split TAGS_REGEX
    end
end
