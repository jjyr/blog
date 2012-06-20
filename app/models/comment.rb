class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body, :email, :ip, :name

  validates :name,presence: true,length: 1..10
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,presence: true,format: {with: VALID_EMAIL_REGEX}
  validates :body,presence: true,length: 1..200

  default_scope order("created_at DESC")
end
