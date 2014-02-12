class User < ActiveRecord::Base
	has_many :posts
	has_many :certs
	has_many :jobs
end
