class Like < ActiveRecord::Base
	belongs_to :bookmark
	belongs_to :user
end





# User	Topic
# 	Likes