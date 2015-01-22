# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create User
5.times do |n|
	user = User.create(
		email: "#{n}@example.com",
		password: '12345678'
	)
	user.skip_confirmation!
	user.save!
end
users = User.all

# Create Topics
50.times do
	Topic.create!(
		title: Faker::Lorem.characters(10),
	 	user: users.sample
	)
end
topics = Topic.all
 
#  # Create Bookmarks
50.times do
	Bookmark.create!(
		url: Faker::Internet.url,
		topic: Topic.all.sample
				
	)
end

bookmarks = Bookmark.all
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Topic.count} lists created"
 puts "#{Bookmark.count} list items created"