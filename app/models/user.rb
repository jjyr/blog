class User < ActiveRecord::Base

  before_save :gener_authentication_token

  has_secure_password
  attr_accessible :email,:name,:password,:password_confirmation

  validates :name,presence: true,length: 1..20
  validates :email,presence: true,uniqueness: {case_sensitive: false},format: {with: Comment::VALID_EMAIL_REGEX}
  validates :password,presence: true,length:6..20
  validates :password_confirmation,presence: true

  private
    def gener_authentication_token
      self.authentication_token = SecureRandom.urlsafe_base64
    end
end
