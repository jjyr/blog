class Post < ActiveRecord::Base
  attr_accessible :body, :title

  validates :title,presence: true,uniqueness: true
  validates :body,presence: true

  has_many :comments,dependent: :destroy
  has_many :tags,dependent: :destroy
end
