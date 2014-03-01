class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
  	before_create :create_remember_token

	attr_accessible :name, :email, :password, :password_confirmation
	has_secure_password
	before_save { self.email = email.downcase }
	has_many :posts, dependent: :destroy
	has_many :certs
	has_many :jobs
	validates :name, presence: true, length: {maximum: 50}
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  	validates :password, length: {minimum: 9}
  	after_validation {self.errors.messages.delete(:password_digest)}

  	def User.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

  	def User.encrypt(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
