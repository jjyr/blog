class Tag < ActiveRecord::Base
  belongs_to :post
  attr_accessible :name

  validates :name,presence: true

  def self.tags
    select("distinct name,count(tags.name)").order("count(tags.name) DESC").group "tags.name"
  end

  def self.find_tags_by_name name
    where "name = ?",name
  end

  def self.top n
    tags.limit n
  end

  def tag_count
    Tag.find_tags_by_name(name).count
  end
end
