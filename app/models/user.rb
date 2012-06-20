class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email,:name,:password,:password_confirmation

  validates :name,presence: true,length: 1..20
  validates :email,presence: true,uniqueness: {case_sensitive: false},format: {with: Comment::VALID_EMAIL_REGEX}
  validates :password,presence: true,length:6..20
  validates :password_confirmation,presence: true
end
