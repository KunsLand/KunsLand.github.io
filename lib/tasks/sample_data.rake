namespace :db do
	desc "File database with sample data"
	task populate: :environment do
		make_users
		make_microposts
		make_relationships
	end
end
def make_users
	admin = User.create!(name: "li kun",
		email: "leekuen8464@hotmail.com",
		password: "9510263",
		password_confirmation: "9510263")
	admin.toggle!(:admin)

	99.times do |n|
		name  = Faker::Name.name
		email = "example-#{n+1}@railstutorial.org"
		password = "password"
		User.create!(name: name,
			email: email,
			password: password,
			password_confirmation: password)
	end	
end

def make_microposts
	users = User.all(limit: 6)
	50.times do
		content = Faker::Lorem.sentences(5)
		users.each { |user| user.microposts.create!(content: content) }
	end
end

def make_relationships
	users = User.all
	user = users.first
	followed_users = users[2..50]
	followers       = users[3..40]
	followed_users.each { |followed| user.follow!(followed) }
	followers.each 		{ |follower| follower.follow!(user) }
end