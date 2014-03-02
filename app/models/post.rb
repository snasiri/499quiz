class Post < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true, length: {maximum: 255}
	validates :user_id, presence: true
	attr_accessible :content
end
