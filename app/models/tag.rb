class Tag < ActiveRecord::Base
  belongs_to :post
  attr_accessible :name

  validates :name,presence: true
  validates :name,length: 1..10

  def self.tags
    group("name").order "count(name) DESC"
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
end
