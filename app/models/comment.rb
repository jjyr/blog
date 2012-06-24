class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body, :email, :ip, :name

  validates :name,presence: true
  validates :name,length: 1..10,unless: ->{name.blank?}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,presence: true
  validates :email,format: {with: VALID_EMAIL_REGEX},unless: ->{email.blank?}
  validates :body,presence: true
  validates :body,length: 1..200,unless: ->{body.blank?}

  default_scope order("created_at")
end
