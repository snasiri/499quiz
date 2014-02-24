class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	has_secure_password
	before_save { self.email = email.downcase }
	has_many :posts
	has_many :certs
	has_many :jobs
	validates :name, presence: true, length: {maximum: 50}
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  	validates :password, presence: true, length: {minimum: 6}
  	after_validation {self.errors.messages.delete(:password_digest)}
end
